
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:livekit_client/livekit_client.dart';
import 'package:timesmedlite/service/feb_rtc/feb_rtc_peer.dart';
import '../../../service/feb_rtc/entity.dart';
import '../../providers/webrtc_service_provider.dart';
import '../local_size_builder.dart';

import 'no_video.dart';
import 'participant_info.dart';
import 'participant_stats.dart';

abstract class ParticipantWidget extends StatefulWidget {
  // Convenience method to return relevant widget for participant
  static ParticipantWidget widgetFor(ParticipantTrack participantTrack,
      {bool showStatsLayer = false, VoidCallback? onTap, VoidCallback? onLongPress, }) {
    if (participantTrack.participant is LocalParticipant) {
      return LocalParticipantWidget(
          participantTrack.participant as LocalParticipant,
          participantTrack.videoTrack,
          participantTrack.isScreenShare,
          showStatsLayer, onTap: onTap, onLongPress: onLongPress,);
    } else if (participantTrack.participant is RemoteParticipant) {
      return RemoteParticipantWidget(
          participantTrack.participant as RemoteParticipant,
          participantTrack.videoTrack,
          participantTrack.isScreenShare,
          showStatsLayer, onTap: onTap, onLongPress: onLongPress,);
    }
    throw UnimplementedError('Unknown participant type');
  }

  // Must be implemented by child class
  abstract final Participant participant;
  abstract final VideoTrack? videoTrack;
  abstract final bool isScreenShare;
  abstract final bool showStatsLayer;
  abstract final VoidCallback? onTap, onLongPress;
  final VideoQuality quality;

  const ParticipantWidget({
    this.quality = VideoQuality.MEDIUM,
    Key? key,
  }) : super(key: key);
}

class LocalParticipantWidget extends ParticipantWidget {
  @override
  final LocalParticipant participant;
  @override
  final VideoTrack? videoTrack;
  @override
  final bool isScreenShare;
  @override
  final bool showStatsLayer;
  @override
  final VoidCallback? onTap, onLongPress;

  const LocalParticipantWidget(
    this.participant,
    this.videoTrack,
    this.isScreenShare,
    this.showStatsLayer, {
    Key? key,
        this.onLongPress,
        this.onTap
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LocalParticipantWidgetState();
}

class RemoteParticipantWidget extends ParticipantWidget {
  @override
  final RemoteParticipant participant;
  @override
  final VideoTrack? videoTrack;
  @override
  final bool isScreenShare;
  @override
  final bool showStatsLayer;
  @override
  final VoidCallback? onTap, onLongPress;

  const RemoteParticipantWidget(
    this.participant,
    this.videoTrack,
    this.isScreenShare,
    this.showStatsLayer, {
    Key? key,
        this.onLongPress,
        this.onTap
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RemoteParticipantWidgetState();
}

abstract class _ParticipantWidgetState<T extends ParticipantWidget>
    extends State<T> {
  //
  bool _visible = true;
  VideoTrack? get activeVideoTrack;
  TrackPublication? get videoPublication;
  TrackPublication? get firstAudioPublication;

  bool get local => widget.participant is LocalParticipant;

  @override
  void initState() {
    super.initState();
    widget.participant.addListener(_onParticipantChanged);
    _onParticipantChanged();
  }

  @override
  void dispose() {
    widget.participant.removeListener(_onParticipantChanged);
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant T oldWidget) {
    oldWidget.participant.removeListener(_onParticipantChanged);
    widget.participant.addListener(_onParticipantChanged);
    _onParticipantChanged();
    super.didUpdateWidget(oldWidget);
  }

  // Notify Flutter that UI re-build is required, but we don't set anything here
  // since the updated values are computed properties.
  void _onParticipantChanged() => setState(() {});

  // Widgets to show above the info bar
  List<Widget> extraWidgets(bool isScreenShare) => [];

  @override
  Widget build(BuildContext ctx) {
    // final live = context.findAncestorWidgetOfExactType<LivePage>() != null;

    placeholder(size, value){
      return const SizedBox.shrink();
    }
    final service = WebRTCServiceProvider.of(context);
    final peer = service?.value.connections[widget.participant.identity] ?? FebRtcPeer(localStream: null, initialConfig: FebRtcPeerConfig(), onRenegotiationNeeded: (_ ) {  },
        onIceCandidate: (_ ) {  });

    return ValueListenableBuilder(
      valueListenable: peer,
      builder: (_, value, __){

        return LocalSizeBuilder(
            builder: (context, size) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                foregroundDecoration: BoxDecoration(
                  border: widget.participant.isSpeaking && !widget.isScreenShare
                      ? Border.all(
                    width: 4,
                    color: Colors.blue,
                  )
                      : Border.all(
                    width: 2,
                    color: Colors.transparent,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                decoration: BoxDecoration(
                  color: Theme.of(ctx).cardColor,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Theme.of(ctx).dividerColor.withOpacity(0.25),
                    width: 1.5,
                  ),
                ),
                margin: const EdgeInsets.all(4),
                clipBehavior: Clip.antiAlias,
                child: Stack(
                  children: [
                    // Video
                    InkWell(
                      onTap: widget.onTap,
                      onLongPress: widget.onLongPress,
                      child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 500),
                          child: (){
                            return activeVideoTrack != null && !activeVideoTrack!.muted
                                ? VideoTrackRenderer(
                              activeVideoTrack!,
                              fit: widget.isScreenShare ?
                              RTCVideoViewObjectFit.RTCVideoViewObjectFitContain
                                  :RTCVideoViewObjectFit.RTCVideoViewObjectFitCover,
                            )
                                :  placeholder(size, value);
                          }()
                      ),
                    ),
                    // if (widget.showStatsLayer)
                    //   Positioned(
                    //       top: 30,
                    //       right: 30,
                    //       child: ParticipantStatsWidget(
                    //         participant: widget.participant,
                    //       )),
                    // Bottom bar
                Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // ...extraWidgets(widget.isScreenShare),
                          ParticipantInfoWidget(
                            title: widget.participant.name.isNotEmpty
                                ? '${widget.participant.name} (${widget.participant.identity})'
                                : widget.participant.identity,
                            audioAvailable: firstAudioPublication?.muted == false &&
                                firstAudioPublication?.subscribed == true,
                            connectionQuality: widget.participant.connectionQuality,
                            isScreenShare: widget.isScreenShare,
                            enabledE2EE: widget.participant.isEncrypted,
                            // value: value,
                            active: activeVideoTrack != null && !activeVideoTrack!.muted,
                            local: local,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
        );
      },
    );
  }
}

class _LocalParticipantWidgetState
    extends _ParticipantWidgetState<LocalParticipantWidget> {
  @override
  LocalTrackPublication<LocalVideoTrack>? get videoPublication =>
      widget.participant.videoTrackPublications
          .where((element) => element.sid == widget.videoTrack?.sid)
          .firstOrNull;

  @override
  LocalTrackPublication<LocalAudioTrack>? get firstAudioPublication =>
      widget.participant.audioTrackPublications.firstOrNull;

  @override
  VideoTrack? get activeVideoTrack => widget.videoTrack;
}

class _RemoteParticipantWidgetState
    extends _ParticipantWidgetState<RemoteParticipantWidget> {
  @override
  RemoteTrackPublication<RemoteVideoTrack>? get videoPublication =>
      widget.participant.videoTrackPublications
          .where((element) => element.sid == widget.videoTrack?.sid)
          .firstOrNull;

  @override
  RemoteTrackPublication<RemoteAudioTrack>? get firstAudioPublication =>
      widget.participant.audioTrackPublications.firstOrNull;

  @override
  VideoTrack? get activeVideoTrack => widget.videoTrack;

  @override
  List<Widget> extraWidgets(bool isScreenShare) => [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Menu for RemoteTrackPublication<RemoteAudioTrack>
            if (firstAudioPublication != null && !isScreenShare)
              RemoteTrackPublicationMenuWidget(
                pub: firstAudioPublication!,
                icon: Icons.volume_up,
              ),
            // Menu for RemoteTrackPublication<RemoteVideoTrack>
            if (videoPublication != null)
              RemoteTrackPublicationMenuWidget(
                pub: videoPublication!,
                icon: isScreenShare ? Icons.monitor : Icons.videocam,
              ),
            if (videoPublication != null)
              RemoteTrackFPSMenuWidget(
                pub: videoPublication!,
                icon: Icons.menu,
              ),
            if (videoPublication != null)
              RemoteTrackQualityMenuWidget(
                pub: videoPublication!,
                icon: Icons.monitor_outlined,
              ),
          ],
        ),
      ];
}

class RemoteTrackPublicationMenuWidget extends StatelessWidget {
  final IconData icon;
  final RemoteTrackPublication pub;
  const RemoteTrackPublicationMenuWidget({
    required this.pub,
    required this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Material(
        color: Colors.black.withOpacity(0.3),
        child: PopupMenuButton<Function>(
          tooltip: 'Subscribe menu',
          icon: Icon(icon,
              color: {
                TrackSubscriptionState.notAllowed: Colors.red,
                TrackSubscriptionState.unsubscribed: Colors.grey,
                TrackSubscriptionState.subscribed: Colors.green,
              }[pub.subscriptionState]),
          onSelected: (value) => value(),
          itemBuilder: (BuildContext context) => <PopupMenuEntry<Function>>[
            // Subscribe/Unsubscribe
            if (pub.subscribed == false)
              PopupMenuItem(
                child: const Text('Subscribe'),
                value: () => pub.subscribe(),
              )
            else if (pub.subscribed == true)
              PopupMenuItem(
                child: const Text('Un-subscribe'),
                value: () => pub.unsubscribe(),
              ),
          ],
        ),
      );
}

class RemoteTrackFPSMenuWidget extends StatelessWidget {
  final IconData icon;
  final RemoteTrackPublication pub;
  const RemoteTrackFPSMenuWidget({
    required this.pub,
    required this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Material(
        color: Colors.black.withOpacity(0.3),
        child: PopupMenuButton<Function>(
          tooltip: 'Preferred FPS',
          icon: Icon(icon, color: Colors.white),
          onSelected: (value) => value(),
          itemBuilder: (BuildContext context) => <PopupMenuEntry<Function>>[
            PopupMenuItem(
              child: const Text('30'),
              value: () => pub.setVideoFPS(30),
            ),
            PopupMenuItem(
              child: const Text('15'),
              value: () => pub.setVideoFPS(15),
            ),
            PopupMenuItem(
              child: const Text('8'),
              value: () => pub.setVideoFPS(8),
            ),
          ],
        ),
      );
}

class RemoteTrackQualityMenuWidget extends StatelessWidget {
  final IconData icon;
  final RemoteTrackPublication pub;
  const RemoteTrackQualityMenuWidget({
    required this.pub,
    required this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Material(
        color: Colors.black.withOpacity(0.3),
        child: PopupMenuButton<Function>(
          tooltip: 'Preferred Quality',
          icon: Icon(icon, color: Colors.white),
          onSelected: (value) => value(),
          itemBuilder: (BuildContext context) => <PopupMenuEntry<Function>>[
            PopupMenuItem(
              child: const Text('HIGH'),
              value: () => pub.setVideoQuality(VideoQuality.HIGH),
            ),
            PopupMenuItem(
              child: const Text('MEDIUM'),
              value: () => pub.setVideoQuality(VideoQuality.MEDIUM),
            ),
            PopupMenuItem(
              child: const Text('LOW'),
              value: () => pub.setVideoQuality(VideoQuality.LOW),
            ),
          ],
        ),
      );
}
