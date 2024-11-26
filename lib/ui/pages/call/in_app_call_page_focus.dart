import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:permission_handler/permission_handler.dart' as PH;

//import 'package:flutter_vonage_video/flutter_vonage_video.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:livekit_client/livekit_client.dart';
import 'package:timesmedlite/di/dependency_injection.dart';
import 'package:timesmedlite/service/feb_rtc/feb_rtc_sdk.dart';
import 'package:timesmedlite/ui/components/doctor_header.dart';
import 'package:timesmedlite/ui/components/local_view.dart';
import 'package:timesmedlite/ui/pages/call/call_actions.dart';
import 'package:timesmedlite/ui/pages/call/extend_call_dialog.dart';
import 'package:timesmedlite/ui/providers/webrtc_service_provider.dart';
import 'package:timesmedlite/ui/routes/routes.dart';
import 'package:timesmedlite/ui/theme/theme.dart';
import 'package:timesmedlite/ui/widgets/livekit/participant.dart';
import 'package:timesmedlite/ui/widgets/livekit/participant_info.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';
import 'package:timesmedlite/utils/local_storage.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';
import 'package:timesmedlite/utils/string_utils.dart';

import 'call_bloc.dart';
import 'package:permission_handler/permission_handler.dart';

import 'livekit.dart';

class InCallAppPageFocus extends StatefulWidget {
  final bool doctor;
  final String? token, session, apId, title, keyId;
  final int? patID;

  const InCallAppPageFocus(
      {Key? key,
        this.doctor = false,
        this.session,
        this.token,
        this.apId,
        this.title,
        this.keyId,
        this.patID})
      : super(key: key);

  @override
  State<InCallAppPageFocus> createState() => _InCallAppPageFocusState();
}

class _InCallAppPageFocusState extends State<InCallAppPageFocus> {
  final CallBloc bloc = CallBloc();
  final GlobalKey<ExpandableFabState> fab = GlobalKey();

  final Room _room = Room(
      roomOptions: const RoomOptions(
        adaptiveStream: true,
        dynacast: true,
        // defaultAudioPublishOptions: const AudioPublishOptions(
        //   name: 'custom_audio_track_name',
        //   stream: 'custom_sync_stream_id',
        // ),
        // defaultVideoPublishOptions: VideoPublishOptions(
        //   stream: 'custom_sync_stream_id',
        //   simulcast: args.simulcast,
        //   videoCodec: args.preferredCodec,
        //   backupVideoCodec: BackupVideoCodec(
        //     enabled: args.enableBackupVideoCodec,
        //   ),
        // ),
        defaultScreenShareCaptureOptions: ScreenShareCaptureOptions(
            useiOSBroadcastExtension: true,
            params: VideoParameters(
                dimensions: VideoDimensionsPresets.h1080_169,
                encoding: VideoEncoding(
                  maxBitrate: 3 * 1000 * 1000,
                  maxFramerate: 15,
                ))),
        defaultCameraCaptureOptions: CameraCaptureOptions(
          maxFrameRate: 30,
        ),
      ));
  Room get room => _room;
  // FebRtcSdk? service;
  String? appointmentID;

  late String caller, receiver;

  GlobalKey<MTimerState> timer = GlobalKey();
  Duration maximum = const Duration(minutes: 15);

  checkPermission() async {
    if (lkPlatformIsMobile()) {
      if (await PH.Permission.camera.request().isGranted) {
        if (await PH.Permission.microphone.request().isGranted) {
          if (!kIsWeb && Platform.isAndroid) {
            if (await PH.Permission.phone.request().isGranted) {
              return true;
            }
          }
          return true;
        }
      }
      return false;
    }
    return true;
  }
  initRoom() async {
    if (!kIsWeb && Platform.isAndroid) {
      final perms = await checkPermission();
      if (!perms) {
        return initRoom();
      }
    }
    if (!kIsWeb && Platform.isIOS) {
      try {
        PermissionUtils.cameraCheckOrRequest(context);
      } catch (_) {}
      try {
        PermissionUtils.microphoneCheckOrRequest(context);
      } catch (_) {}
    }
    room.createListener();
    final at = AccessToken(
      'APIjmPfoWgmMeAT',
      'sZMK962Yo3CdcahWzuLoqIBmmfvqRvJfT4cRM1v28Id',
      identity: '${LocalStorage.getUID()}',
    );
    at.addGrant({'room': widget.keyId, 'roomJoin': true});
    print('${at.identity}, ${at.grants}');
    final token = await at.toJwt();
    print('Token: $token');
    try {
      const timeout = Duration(seconds: 3);
      await room.connect(
        'wss://coturn.focus.ind.in',
        token,
        connectOptions: const ConnectOptions(
            timeouts: Timeouts(
              connection: timeout,
              debounce: Duration(milliseconds: 100),
              publish: timeout,
              peerConnection: timeout,
              iceRestart: timeout,
            )),
        // roomOptions: ,
        // fastConnectOptions: FastConnectOptions(
        //   microphone: TrackOption(track: _audioTrack),
        //   camera: TrackOption(track: _videoTrack),
        // ),
      );
      print('Livekit Joined');
      setState(() {});
    } catch (e) {
      print('Livekit Error: $e ${e.runtimeType}');
      await Future.delayed(const Duration(seconds: 1));
      if (mounted) {
        initRoom();
      }
    }
    _setUpListeners();
    _askPublish();
    _sortParticipants();

  }

  late DocumentReference session;

  onEnded() async {
    context.pop();
    if (widget.doctor) {
      context.push(Routes.updateCallStatus, {
        'appointmentIDFromCallScreen': '$appointmentID',
        'currentCallKey': '${widget.keyId}'
      });
    } else {
      context.push(Routes.feedbackPage);
    }
  }

  // final RTCVideoRenderer localRenderer = RTCVideoRenderer();

  @override
  void initState() {
    session = FirebaseFirestore.instance
        .collection('session')
        .doc((widget.session?.isEmpty ?? false) ? 'nothing' : widget.session);

    initRoom();
    // service = FebRtcSdk(
    //   socketUrl: 'https://focus.ind.in',
    //   roomId: widget.session ?? '',
    //   userId: LocalStorage.getUID().toString(),
    //   voice: true,
    //   video: true,
    //
    //   onStreamChanged: () async {
    //     print('onStreamChanged');
    //     // await localRenderer.initialize();
    //     // localRenderer.srcObject = service?.value.stream;
    //     // setState(() {});
    //   },
    // );

    // if(widget.doctor){
    //   config = VonageConfigs(widget.token ?? '', '45704562', widget.session ?? '');
    // } else {
    //   config = VonageConfigs(widget.token ?? '', '45704562', widget.session ?? '');
    // }
    caller = (appointmentID = widget.apId ?? appointmentID)!;
    initFirestore();
    super.initState();
  }

  initFirestore() async {

    _initSession();
    final r = await session.get();
    if (r.exists) {
      await session.update(
        {
          widget.doctor ? 'doctor' : 'patient': true,
          'patient-reject': false,
          'doctor-reject': false
        },
      );
    } else {
      await session.set({
        widget.doctor ? 'doctor' : 'patient': true,
        'patient-reject': false,
        'doctor-reject': false
      });
    }

    session.snapshots().listen((event) {
      final data = event.data();
      if (data is Map) {
        if (data[widget.doctor ? 'patient' : 'doctor'] == true) {}
        if (data[widget.doctor ? 'patient-reject' : 'doctor-reject'] == true) {
          if (mounted) {
            onEnded();
          }
        }
        if (data[widget.doctor ? 'patient-streamed' : 'doctor-streamed'] ==
            true) {
          if (mounted) {
            Injector().apiService.get(
                path: 'TimeTracker', query: {'Appointment_Id': widget.apId});
            timer.currentState?.start();
            setState(() {
              connected = true;
            });
          }
        }
      }
    });
  }
  CameraPosition position = CameraPosition.front;
  @override
  Widget build(BuildContext context) {
    final double paddingTop = widget.doctor ? 76 : 0;

    // if (service == null) {
    //   return const MScaffold(
    //     body: Center(
    //       child: CircularProgressIndicator(),
    //     ),
    //   );
    // }

    return BlocProvider(
      create: (context) => bloc,
      child: BlocConsumer<CallBloc, CallState>(
        listener: (context, state) {
          if (state is EndCall) {}
        },
        builder: (context, state) {
          final read = context.watch<CallBloc>();
          return MScaffold(
            title: Text((widget.title ?? '').toUpperCase()),
            appBarBottom: widget.doctor ? const DoctorHeader() : null,
            automaticallyImplyLeading: false,
            actions: [
              IconButton(
                  onPressed: () async {
                    bloc.add(const SwitchCamera());
                    final track = room.localParticipant?.videoTrackPublications.firstOrNull?.track;
                    if (track == null) return;
                    try {
                      final newPosition = position.switched();
                      await track.setCameraPosition(newPosition);
                      setState(() {
                        position = newPosition;
                      });
                    } catch (error) {
                      print('could not restart track: $error');
                      return;
                    }
                    // service?.switchCamera();
                  },
                  icon: const FaIcon(Icons.flip_camera_ios_outlined))
            ],
            bodyPadding: EdgeInsets.only(top: paddingTop),
            body: Stack(
              children: [
                if (read.view)
                  buildUserCam(context)
                else if (participantTracks.length > 1) ...[
                  buildOppositeCam(context),
                ],
                Positioned(
                  top: 80,
                  right: 16,
                  child: Stack(
                    children: [
                      Material(
                        shape: const CircleBorder(
                            side: BorderSide(color: Colors.white)),
                        clipBehavior: Clip.antiAlias,
                        elevation: 4.0,
                        color: Colors.transparent,
                        child: read.view
                            ? buildOppositeCam(context,
                            small: true,)
                            : buildUserCam(context, small: true),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: MIconButton(
                          onTap: () {
                            bloc.add(const ToggleView());
                          },
                          solid: Colors.white,
                          color: MTheme.THEME_COLOR,
                          padding: const EdgeInsets.all(4),
                          child: const Icon(
                            Icons.sync,
                            color: Colors.grey,
                            size: 20,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: 90,
                  left: 32,
                  child: MTimer(
                    key: timer,
                    autoStart: false,
                    maximum: maximum,
                    builder: (d) {
                      final rem = maximum - d;
                      return Wrap(
                        spacing: 8,
                        children: [
                          Material(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4)),
                            clipBehavior: Clip.antiAlias,
                            color: Colors.white30,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 2),
                              child: Row(
                                children: [
                                  Container(
                                    width: 8,
                                    height: 8,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.red),
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    printDuration(d),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(fontSize: 13),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          if (widget.doctor) ...[
                            Material(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(4)),
                              clipBehavior: Clip.antiAlias,
                              color: Colors.green.withOpacity(0.5),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 2),
                                child: Text(
                                  printDuration(maximum),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(fontSize: 13),
                                ),
                              ),
                            ),
                            Material(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(4)),
                              clipBehavior: Clip.antiAlias,
                              color: Colors.red.withOpacity(0.5),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 2),
                                child: Text(
                                  printDuration(rem),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(fontSize: 13),
                                ),
                              ),
                            ),
                            Material(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(4)),
                              clipBehavior: Clip.antiAlias,
                              color: Colors.amber,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(4),
                                onTap: () async {
                                  final res = await showDialog(
                                      context: context,
                                      builder: (c) => ExtendCallDialog(
                                        appointmentID:
                                        appointmentID ?? '',
                                      ));
                                  if (res is String) {
                                    if (res.contains(':')) {
                                      final l = res.split(':');
                                      if (l.length == 2) {
                                        final h = int.parse(l[0]);
                                        final m = int.parse(l[1]);
                                        final now = DateTime.now();
                                        final n = DateTime(
                                            now.year,
                                            now.month,
                                            now.day,
                                            now.hour,
                                            now.minute);
                                        final e = DateTime(n.year,
                                            n.month, n.day, h, m);
                                        final d = n.difference(e).abs();
                                        setState(() {
                                          maximum += d;
                                        });
                                        timer.currentState?.extend(d);
                                      }
                                    }
                                  }
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 2),
                                  child: Text(
                                    'Extend',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(fontSize: 13),
                                  ),
                                ),
                              ),
                            ),
                          ]
                        ],
                      );
                    },
                  ),
                ),
                if (widget.doctor)
                  CallActions(
                    appointmentid: widget.apId,
                    fab: fab,
                    docID: LocalStorage.getUID(),
                    patID: widget.patID,
                  )
              ],
            ),
            bottom: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MIconButton(
                    child: Icon(read.video
                        ? Icons.videocam
                        : Icons.videocam_off),
                    onTap: () async{
                      bloc.add(const ToggleVideo());
                      try {
                        if(read.video) {
                          print('unviedeo');
                          await  room.localParticipant?.setCameraEnabled(false);
                        }else {
                          print('video');
                          await room.localParticipant?.setCameraEnabled(true);
                        }
                      } catch (error) {
                        print('could not publish or unpublish: $error');
                        return;
                      }
                    },
                  ),
                  MIconButton(
                    onTap: () async {
                      bloc.add(const ToggleMic());
                      final audio = room.localParticipant?.audioTrackPublications.firstOrNull?.track;
                      if (audio == null) return;
                      try {

                        if(read.mute) {
                          print('unmuted');
                          await audio.unmute();
                        }else {
                          print('muted');
                          await audio.mute();
                        }
                      } catch (error) {
                        print('could not mute or unmute: $error');
                        return;
                      }
                    },
                    solid: Colors.white,
                    color: MTheme.THEME_COLOR,
                    child: Icon(
                        read.mute
                            ? CupertinoIcons.mic_slash_fill
                            : CupertinoIcons.mic_fill,
                        color: MTheme.THEME_COLOR),
                  ),
                  MIconButton(
                    solid: Colors.red,
                    onTap: onEnded,
                    padding: const EdgeInsets.all(16),
                    forceBorder: true,
                    child: const Icon(
                      Icons.phone_disabled,
                      size: 30,
                    ),
                  ),
                  MIconButton(
                    onTap: () async {
                      bloc.add(const ToggleSpeaker());
                    },
                    solid: Colors.white,
                    color: MTheme.THEME_COLOR,
                    child: Icon(
                        read.speaker
                            ? CupertinoIcons.volume_up
                            : CupertinoIcons.volume_off,
                        color: MTheme.THEME_COLOR),
                  ),
                  // MIconButton(
                  //   onTap: () {
                  //     context.push(Routes.inAppChatPage);
                  //   },
                  //   solid: Colors.white,
                  //   color: MTheme.THEME_COLOR,
                  //   child: const Icon(CupertinoIcons.chat_bubble_fill,
                  //       color: MTheme.THEME_COLOR),
                  // ),
                ],
              ),
            ),
          );;
        },
      ),
    );
  }

  Widget buildUserCam(BuildContext context, {bool small = false}) {
    final read = context.watch<CallBloc>();

    return AnimatedContainer(
      key: const ValueKey('USER_CAM'),
      duration: const Duration(milliseconds: 300),
      width: small ? 100 : null,
      height: small ? 100 : null,
      decoration: BoxDecoration(
        // color: read.video ? read.frontCam ? Colors.blueGrey : Colors.cyan.shade500 : Colors.black,
        // image: DecorationImage(
        //   image: AssetImage('assets/images/patient.png'),
        //   fit: BoxFit.cover,
        //   opacity: read.video ? 1.0 : 0.5
        // )
      ),

      // alignment: Alignment.center,
      child: read.video
          ? _buildPublisher(context)
          : const Icon(
        Icons.videocam_off,
        color: Colors.white30,
        size: 50,
      ),
    );
  }

  Widget buildOppositeCam(BuildContext context,
      {bool small = false, }) {
    return AnimatedContainer(
      key: const ValueKey('OPP_CAM'),
      duration: const Duration(milliseconds: 300),
      width: small ? 100 : null,
      height: small ? 100 : null,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        // color: Colors.grey,
        // image: DecorationImage(
        //     image: AssetImage('assets/images/doctor.png'),
        //     fit: BoxFit.cover,
        // )
      ),
      child: (participantTracks.isEmpty || participantTracks.length != 2)
          ? const SizedBox.shrink()
          : ParticipantWidget.widgetFor(participantTracks.firstWhere((e) => e.participant != room.localParticipant)),
      //child: _buildSubscriber(context),
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
      // Vonage.onResume();
        break;
      case AppLifecycleState.paused:
      // Vonage.onPause();
        break;
      default:
    }
  }

  bool _sessionInited = false;
  bool _isPublishing = false;

  int pubId = 0;
  int subId = 1;

  bool connected = false;

  Future<void> _initSession() async {
    // service?.join();

    // Timer.periodic(const Duration(seconds: 5), (t){
    //   if(mounted){
    //     setState(() {});
    //   } else {
    //     t.cancel();
    //   }
    // });
    await Future.delayed(const Duration(seconds: 3));
    session.update(
        {(widget.doctor ? 'doctor-streamed' : 'patient-streamed'): true});
    // bloc.add(const ToggleView());
    // await Future.delayed(const Duration(milliseconds: 300));
    // bloc.add(const ToggleView());
  }

  @override
  void dispose() {
    debugPrint('dispose call');
    // service?.leave();
    room.disconnect();
    // if (_isPublishing) {
    //   _unpublishStream();
    // }
    session.update({widget.doctor ? 'doctor-reject' : 'patient-reject': true});
    // if (_sessionInited) {
    //   Vonage.endSession();
    // }
    // Vonage.onPause();
    // Vonage.onStop();
    super.dispose();
  }

  EventsListener<RoomEvent> get _listener =>
       room.createListener();

  void _setUpListeners() => _listener
    ..on<RoomDisconnectedEvent>((event) async {
      if (event.reason != null) {
        print('Room disconnected: reason => ${event.reason}');
      }
      // callKeep.endAllCalls();
      // CallKeep.instance.endAllCalls();
      // CallKeep.instance.endCall('${widget.call?.uuid}');
      // ClearAllNotifications.clear();
      context.pop();
      // WidgetsBindingCompatible.instance?.addPostFrameCallback(
      //     (timeStamp) => Navigator.popUntil(context, (route) => route.isFirst));
    })
    ..on<ParticipantEvent>((event) {
      print('Participant event');
      // sort participants on many track events as noted in documentation linked above
      _sortParticipants();
    })
    ..on<RoomRecordingStatusChanged>((event) {
      // context.showRecordingStatusChangedDialog(event.activeRecording);
    })
    ..on<RoomAttemptReconnectEvent>((event) {
      print(
          'Attempting to reconnect ${event.attempt}/${event.maxAttemptsRetry}, '
              '(${event.nextRetryDelaysInMs}ms delay until next attempt)');
    })
    ..on<LocalTrackPublishedEvent>((_) => _sortParticipants())
    ..on<LocalTrackUnpublishedEvent>((_) => _sortParticipants())
    ..on<TrackSubscribedEvent>((_) => _sortParticipants())
    ..on<TrackUnsubscribedEvent>((_) => _sortParticipants())
    // ..on<TrackE2EEStateEvent>(_onE2EEStateEvent)
    ..on<ParticipantNameUpdatedEvent>((event) {
      print(
          'Participant name updated: ${event.participant.identity}, name => ${event.name}');
      _sortParticipants();
    })
    ..on<ParticipantMetadataUpdatedEvent>((event) {
      print(
          'Participant metadata updated: ${event.participant.identity}, metadata => ${event.metadata}');
    })
    ..on<RoomMetadataChangedEvent>((event) {
      print('Room metadata changed: ${event.metadata}');
    })
    ..on<DataReceivedEvent>((event) {
      String decoded = 'Failed to decode';
      try {
        // decoded = utf8.decode(event.data);
      } catch (_) {
        print('Failed to decode: $_');
      }
      // context.showDataReceivedDialog(decoded);
    })
    ..on<AudioPlaybackStatusChanged>((event) async {
      if (!room.canPlaybackAudio) {
        print('Audio playback failed for iOS Safari ..........');
        // bool? yesno = await context.showPlayAudioManuallyDialog();
        // if (yesno == true) {
        //   await room.startAudio();
        // }
      }
    });

  void _askPublish() async {
    // final result = await context.showPublishDialog();
    // if (result != true) return;
    // video will fail when running in ios simulator
    try {
      if (true) {
        // await room.localParticipant?.
        CameraCaptureOptions options = const CameraCaptureOptions(
            maxFrameRate: 20, params: VideoParametersPresets.h360_43);
        await room.localParticipant
            ?.setCameraEnabled(true, cameraCaptureOptions: options);
        await Future.delayed(const Duration(milliseconds: 100));
        await room.localParticipant?.setCameraEnabled(false);
        await Future.delayed(const Duration(milliseconds: 100));
        await room.localParticipant
            ?.setCameraEnabled(true, cameraCaptureOptions: options);
        // print('Asked Publish: ${widget.video}');
      }
    } catch (error) {
      print('could not publish video: $error');
      // await context.showErrorDialog(error);
    }
    try {
      await room.localParticipant?.setMicrophoneEnabled(true);
      await Future.delayed(const Duration(milliseconds: 100));
      await room.localParticipant?.setMicrophoneEnabled(false);
      await Future.delayed(const Duration(milliseconds: 100));
      await room.localParticipant?.setMicrophoneEnabled(true);
    } catch (error) {
      print('could not publish audio: $error');
      // await context.showErrorDialog(error);
    }
    setState(() {
      initialized = true;
    });
  }

  List<ParticipantTrack> participantTracks = [];

  bool initialized = false;

  void _sortParticipants() {
    if (!initialized) return;
    List<ParticipantTrack> userMediaTracks = [];
    List<ParticipantTrack> screenTracks = [];
    for (var participant in room.remoteParticipants.values) {
      // final s = service?.value.connections[participant.identity];
      // if (s == null) {
      //   continue;
      // }

      for (var t in participant.videoTrackPublications) {
        if (t.isScreenShare) {
          screenTracks.add(ParticipantTrack(
            participant: participant,
            videoTrack: t.track,
            isScreenShare: true,
          ));
        } else {
          userMediaTracks.add(ParticipantTrack(
            participant: participant,
            videoTrack: t.track,
            isScreenShare: false,
          ));
        }
      }
      if (participant.videoTrackPublications.isEmpty) {
        userMediaTracks.add(ParticipantTrack(
          participant: participant,
          videoTrack: null,
          isScreenShare: false,
        ));
      }
    }
    // sort speakers for the grid
    // userMediaTracks.sort((a, b) {
    //   // loudest speaker first
    //   if (a.participant.isSpeaking && b.participant.isSpeaking) {
    //     if (a.participant.audioLevel > b.participant.audioLevel) {
    //       return -1;
    //     } else {
    //       return 1;
    //     }
    //   }
    //
    //   // last spoken at
    //   final aSpokeAt = a.participant.lastSpokeAt?.millisecondsSinceEpoch ?? 0;
    //   final bSpokeAt = b.participant.lastSpokeAt?.millisecondsSinceEpoch ?? 0;
    //
    //   if (aSpokeAt != bSpokeAt) {
    //     return aSpokeAt > bSpokeAt ? -1 : 1;
    //   }
    //
    //   // video on
    //   if (a.participant.hasVideo != b.participant.hasVideo) {
    //     return a.participant.hasVideo ? -1 : 1;
    //   }
    //
    //   // joinedAt
    //   return a.participant.joinedAt.millisecondsSinceEpoch -
    //       b.participant.joinedAt.millisecondsSinceEpoch;
    // });

    final localParticipantTracks =
        room.localParticipant?.videoTrackPublications;
    if (localParticipantTracks != null) {
      for (var t in localParticipantTracks) {
        if (t.isScreenShare) {
          if (lkPlatformIs(PlatformType.iOS)) {
            // if (!_flagStartedReplayKit) {
            //   _flagStartedReplayKit = true;
            //
            //   ReplayKitChannel.startReplayKit();
            // }
          }
          screenTracks.add(ParticipantTrack(
            participant: room.localParticipant!,
            videoTrack: t.track,
            isScreenShare: true,
          ));
        } else {
          if (lkPlatformIs(PlatformType.iOS)) {
            // if (_flagStartedReplayKit) {
            //   _flagStartedReplayKit = false;
            //
            //   ReplayKitChannel.closeReplayKit();
            // }
          }

          userMediaTracks.add(ParticipantTrack(
            participant: room.localParticipant!,
            videoTrack: t.track,
            isScreenShare: false,
          ));
        }
      }
    }
    if (room.localParticipant != null) {
      if (room.localParticipant?.videoTrackPublications.isEmpty ?? false) {
        userMediaTracks.add(ParticipantTrack(
          participant: room.localParticipant!,
          videoTrack: null,
          isScreenShare: false,
        ));
      }
    }
    setState(() {
      participantTracks = [...screenTracks, ...userMediaTracks];
    });
  }

  Widget _buildPublisher(var context) {
    final local = room.localParticipant;
    if (local == null || participantTracks.isEmpty) {
      return const SizedBox.shrink();
    }

    return ParticipantWidget.widgetFor(
      participantTracks.firstWhere((e) =>
      e.participant ==
          room.localParticipant),
    );
  }

  Widget _buildSubscriber(var context) {
    String viewType = 'vonage-sub';
    Map<String, dynamic> creationParams = <String, dynamic>{};
    final key = ValueKey('sub${DateTime.now()}');
    if (Platform.isAndroid) {
      return AndroidView(
        key: key,
        viewType: viewType,
        layoutDirection: TextDirection.ltr,
        creationParams: subId,
        creationParamsCodec: const StandardMessageCodec(),
        onPlatformViewCreated: (int id) {
          subId = id;
        },
      );
    } else if (Platform.isIOS) {
      return UiKitView(
        key: key,
        viewType: viewType,
        layoutDirection: TextDirection.ltr,
        creationParams: subId,
        creationParamsCodec: const StandardMessageCodec(),
        onPlatformViewCreated: (int id) {
          subId = id;
        },
      );
    } else {
      return Text('Unsupported Platform');
    }
  }
}


class PermissionUtils {
  static Future<bool> cameraCheckOrRequest(BuildContext context) async {
    PermissionStatus status = await Permission.camera.request();

    print('Permission status: $status, granted: ${status.isGranted}, denied: ${status.isDenied}, permanentlyDenied: ${status.isPermanentlyDenied}, restricted: ${status.isRestricted}, limited: ${status.isLimited}, isProvisional: ${status.isProvisional}');
    if(status.isGranted){
      return true;
    }
    if(status.isDenied){
      final status = await Permission.camera.request();
      if(status.isGranted){
        return true;
      }
    }
    if(status.isPermanentlyDenied){
      if(kIsWeb) return false;
      if(!context.mounted) return false;
      return false;
    }
    if(!context.mounted) return false;
    return false;
  }
  static Future<bool> check(Permission permission) async {
    return await permission.request().isGranted;
  }

  static Future<bool> checkOrRequest(Permission permission, BuildContext context, {
    Future<bool?> Function()? onGranted,
  }) async {
    PermissionStatus status = await permission.request();

    print('Permission status: $status, granted: ${status.isGranted}, denied: ${status.isDenied}, permanentlyDenied: ${status.isPermanentlyDenied}, restricted: ${status.isRestricted}, limited: ${status.isLimited}, isProvisional: ${status.isProvisional}');
    if(status.isGranted){
      return true;
    }
    if(status.isDenied){
      status = await permission.request();
      if(status.isGranted){
        return true;
      }
    }
    if(status.isPermanentlyDenied || status.isDenied){
      if(kIsWeb) return false;
      if(!context.mounted) return false;
      if(onGranted != null){
        final ack = await onGranted();
        if(ack ?? false) {
          openAppSettings();
        }
        return false;
      } else {
        return true;
      }
      return false;
    }
    if(!context.mounted) return false;
    return false;
  }

  static Future<bool> contactsCheckOrRequest(BuildContext context) async {
    PermissionStatus status = await Permission.contacts.request();

    print('Permission status: $status, granted: ${status.isGranted}, denied: ${status.isDenied}, permanentlyDenied: ${status.isPermanentlyDenied}, restricted: ${status.isRestricted}, limited: ${status.isLimited}, isProvisional: ${status.isProvisional}');
    if(status.isGranted){
      return true;
    }
    if(status.isDenied){
      final status = await Permission.contacts.request();
      if(status.isGranted){
        return true;
      }
    }
    if(status.isPermanentlyDenied){
      if(kIsWeb) return false;
      return false;
    }
    if(!context.mounted) return false;
    return false;
  }

  static Future<bool> locationCheckOrRequest(BuildContext context) async {
    PermissionStatus status = await Permission.location.request();

    print('Permission status: $status, granted: ${status.isGranted}, denied: ${status.isDenied}, permanentlyDenied: ${status.isPermanentlyDenied}, restricted: ${status.isRestricted}, limited: ${status.isLimited}, isProvisional: ${status.isProvisional}');
    if(status.isGranted){
      return true;
    }
    if(status.isDenied){
      final status = await Permission.location.request();
      if(status.isGranted){
        return true;
      }
    }
    if(status.isPermanentlyDenied){
      if(kIsWeb) return false;
      if(!context.mounted) return false;
      return false;
    }
    if(!context.mounted) return false;
    return false;
  }

  static Future<bool> microphoneCheckOrRequest(BuildContext context) async {
    PermissionStatus status = await Permission.microphone.request();

    print('Permission status: $status, granted: ${status.isGranted}, denied: ${status.isDenied}, permanentlyDenied: ${status.isPermanentlyDenied}, restricted: ${status.isRestricted}, limited: ${status.isLimited}, isProvisional: ${status.isProvisional}');
    if(status.isGranted){
      return true;
    }
    if(status.isDenied){
      final status = await Permission.microphone.request();
      if(status.isGranted){
        return true;
      }
    }
    if(status.isPermanentlyDenied){
      if(kIsWeb) return false;
      if(!context.mounted) return false;
      return false;
    }
    if(!context.mounted) return false;
    return false;
  }
}

extension PermissionExtension on Permission {
  String get name {
    switch(value){
      case 1: return 'Camera';
      case 2: return 'Contacts';
      case 3: return 'Location';
      case 7: return 'Microphone';
      case 8: return 'Phone';
      default: return 'Unknown';
    }
  }

  String get description {
    final appName = 'Timesmed';
    switch(value){
      case 1: return 'Allow access to camera for $appName to start video calls and take photos';
      case 2: return 'Allow access to contacts';
      case 3: return 'Allow access to location';
      case 7: return 'Allow access to microphone for $appName to start audio calls';
      case 8: return 'Allow access to phone';
      default: return 'Unknown';
    }
  }
}