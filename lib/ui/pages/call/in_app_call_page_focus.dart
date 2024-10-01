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

//import 'package:flutter_vonage_video/flutter_vonage_video.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:timesmedlite/di/dependency_injection.dart';
import 'package:timesmedlite/service/feb_rtc/feb_rtc_sdk.dart';
import 'package:timesmedlite/ui/components/doctor_header.dart';
import 'package:timesmedlite/ui/components/local_view.dart';
import 'package:timesmedlite/ui/pages/call/call_actions.dart';
import 'package:timesmedlite/ui/pages/call/extend_call_dialog.dart';
import 'package:timesmedlite/ui/providers/webrtc_service_provider.dart';
import 'package:timesmedlite/ui/routes/routes.dart';
import 'package:timesmedlite/ui/theme/theme.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';
import 'package:timesmedlite/utils/local_storage.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';
import 'package:timesmedlite/utils/string_utils.dart';

import 'call_bloc.dart';
import 'package:permission_handler/permission_handler.dart';

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

  FebRtcSdk? service;
  String? appointmentID;

  late String caller, receiver;

  GlobalKey<MTimerState> timer = GlobalKey();
  Duration maximum = const Duration(minutes: 15);

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

  final RTCVideoRenderer localRenderer = RTCVideoRenderer();

  @override
  void initState() {
    print('ggggggggggggggggggggg ${widget.session} ,${LocalStorage.getUID().toString()},${widget.keyId}');
    session = FirebaseFirestore.instance
        .collection('session')
        .doc((widget.session?.isEmpty ?? false) ? 'nothing' : widget.session);

    service = FebRtcSdk(
      socketUrl: 'https://focus.ind.in',
      roomId: widget.keyId ?? '',
      // roomId: widget.session ?? '',
      userId: LocalStorage.getUID().toString(),
      voice: true,
      video: true,
      onStreamChanged: () async {
        print('onStreamChanged');
        await localRenderer.initialize();
        localRenderer.srcObject = service?.value.stream;
        setState(() {});
      },
    );

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

  @override
  Widget build(BuildContext context) {
    final double paddingTop = widget.doctor ? 76 : 0;

    if (service == null) {
      return const MScaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return WebRTCServiceProvider(
      service: service!,
      child: BlocProvider(
        create: (context) => bloc,
        child: BlocConsumer<CallBloc, CallState>(
          listener: (context, state) {
            if (state is EndCall) {}
          },
          builder: (context, state) {
            final read = context.watch<CallBloc>();
            return ValueListenableBuilder<FebRtcSdkValue>(
                valueListenable: service!,
                builder: (context, value, __) {
                  return MScaffold(
                    title: Text((widget.title ?? '').toUpperCase()),
                    appBarBottom: widget.doctor ? const DoctorHeader() : null,
                    automaticallyImplyLeading: false,
                    actions: [
                      IconButton(
                          onPressed: () {
                            bloc.add(const SwitchCamera());
                            service?.switchCamera();
                          },
                          icon: const FaIcon(Icons.flip_camera_ios_outlined))
                    ],
                    bodyPadding: EdgeInsets.only(top: paddingTop),
                    body: Stack(
                      children: [
                        if (read.view)
                          buildUserCam(context)
                        else if (value.connections.isNotEmpty) ...[
                          buildOppositeCam(context, value: value),
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
                                        small: true, value: value)
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
                                                .caption
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
                                              .caption
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
                                              .caption
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
                                                .caption
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
                            onTap: () {
                              bloc.add(const ToggleVideo());
                            },
                          ),
                          MIconButton(
                            onTap: () {
                              bloc.add(const ToggleMic());
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
                            onTap: () {
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
                  );
                });
          },
        ),
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
      {bool small = false, required FebRtcSdkValue value}) {
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
      child: (value.connections.isEmpty ?? false)
          ? const SizedBox.shrink()
          : RemoteView(connection: value.connections.values.first),
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
    service?.join();

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
    service?.leave();

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

  Widget _buildPublisher(var context) {
    return LocalView(
      key: const ValueKey('PUB'),
      renderer: localRenderer,
      width: 100,
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
