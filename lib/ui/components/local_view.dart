import 'package:flutter/cupertino.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:flutter/material.dart';
import 'package:timesmedlite/service/feb_rtc/entity.dart';
import 'package:timesmedlite/service/feb_rtc/feb_rtc_peer.dart';
import 'package:timesmedlite/ui/components/user_avatar.dart';
import 'package:timesmedlite/ui/providers/webrtc_service_provider.dart';
import 'package:timesmedlite/ui/widgets/local_size_builder.dart';

class LocalView extends StatefulWidget {
  final double width;
  final RTCVideoRenderer renderer;

  const LocalView({Key? key, required this.renderer, this.width = 128})
      : super(key: key);

  @override
  State<LocalView> createState() => _LocalViewState();
}

class _LocalViewState extends State<LocalView> {
  double get getRation =>
      widget.renderer.videoHeight / widget.renderer.videoWidth;

  @override
  void initState() {
    widget.renderer.onResize = () {
      setState(() {});
    };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double ratio = 1;

    // if (ratio.isNaN || ratio.isInfinite || ratio == 0 || ratio > 1) {
    //   ratio = 1;
    // }

    final service = WebRTCServiceProvider.of(context);
    final showRenderer =
        (service?.value.video ?? false) || (service?.value.screen ?? false);
    final flipView =
        (service?.value.video ?? false) && (service?.value.face ?? false);

    return showRenderer
        ? Transform.scale(
      scaleX: flipView ? 1 : -1,
      child: RTCVideoView(widget.renderer,
          objectFit:
          RTCVideoViewObjectFit.RTCVideoViewObjectFitCover,
          placeholderBuilder: (context) {
            return const CupertinoActivityIndicator();
          }),
    )
        : Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          UserAvatar(
            radius: 24,
          ),
          // Text('You')
        ],
      ),
    );
  }
}

class RemoteView extends StatefulWidget {
  final FebRtcPeer? connection;
  final VoidCallback? onTap;

  const RemoteView({Key? key, required this.connection, this.onTap})
      : super(key: key);

  @override
  State<RemoteView> createState() => _RemoteViewState();
}

class _RemoteViewState extends State<RemoteView> {
  double get getRation => (renderer?.videoHeight ?? 0) / (renderer?.videoWidth ?? 0);

  RTCVideoRenderer? get renderer => widget.connection?.renderer;

  @override
  void initState() {
    init();

    super.initState();
  }

  init() async {
    // await renderer.initialize();
    renderer?.onResize = () {
      if (mounted) {
        setState(() {});
      }
    };
    // renderer.srcObject = widget.connection.remoteStream;
    // if(mounted) {
    //   setState(() {});
    // }
    widget.connection?.onConnectionStateChanged = (state) {
      renderer?.srcObject = widget.connection?.remoteStream;
      if (mounted) {
        setState(() {});
      }
    };
    // widget.connection.on('candidate', null, (ev, context) {
    //   renderer.srcObject = widget.connection.remoteStream;
    //   setState(() {});
    // });
    // widget.connection.on('connected', null, (ev, context) {
    //   renderer.srcObject = widget.connection.remoteStream;
    //   setState(() {});
    // });
    // widget.connection.on('stream-changed', null, (ev, context) {
    //   renderer.srcObject = widget.connection.remoteStream;
    //   setState(() {});
    // });
  }

  @override
  Widget build(BuildContext context) {
    double ratio = getRation;

    if (ratio.isNaN || ratio.isInfinite || ratio == 0 || ratio > 1) {
      ratio = 1;
    }
    return LocalSizeBuilder(
        builder: (context, size) {
          return InkWell(
            onTap: widget.onTap,
            borderRadius: BorderRadius.circular(12),
            child: ValueListenableBuilder<FebRtcPeerValue>(
                valueListenable: widget.connection ?? FebRtcPeer(localStream: null, initialConfig: FebRtcPeerConfig(), onRenegotiationNeeded: (_ ) {  },
                    onIceCandidate: (_ ) {  }),
                builder: (_, value, __) {
                  return Stack(
                    children: [
                      if (value.config.video || value.config.screen) ...[
                        if(widget.connection != null)RTCVideoView(widget.connection!.renderer,
                            objectFit: !value.config.screen
                                ? RTCVideoViewObjectFit.RTCVideoViewObjectFitCover
                                : RTCVideoViewObjectFit
                                .RTCVideoViewObjectFitContain,
                            placeholderBuilder: (context) {
                              return const CupertinoActivityIndicator();
                            }),
                        Positioned(
                            left: 12,
                            top: 8,
                            child: Text(
                              value.config.user?.name ?? 'No Name',
                              style: const TextStyle(color: Colors.white, shadows: [
                                Shadow(color: Colors.black, offset: Offset(1, 1), blurRadius: 5)
                              ]),
                            ))
                      ] else
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(),
                            UserAvatar(
                              radius: size.width / 4,
                            ),
                            Text(
                              value.config.user?.name ?? 'No name',
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      if(widget.connection != null)Column(
                        children: [
                          const Spacer(),
                          Row(
                            children: [
                              if (value.config.hand)
                                Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                    padding: const EdgeInsets.all(4),
                                    margin: const EdgeInsets.all(8),
                                    child: const Icon(
                                      Icons.front_hand_rounded,
                                      color: Colors.amber,
                                      size: 16,
                                    )),
                              const Spacer(),
                              // if(widget.connection?.remoteStream != null && widget.connection != null)
                              //   VoiceWidget(stream: widget.connection!.remoteStream!, connection: widget.connection!.rtcPeerConnection!,),
                              Container(
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).colorScheme.onSurface,
                                    shape: BoxShape.circle,
                                  ),
                                  padding: const EdgeInsets.all(4),
                                  margin: const EdgeInsets.all(8),
                                  child: Icon(
                                    value.config.voice
                                        ? Icons.mic
                                        : Icons.mic_off,
                                    color: Theme.of(context).colorScheme.surface,
                                    size: 16,
                                  )),
                            ],
                          )
                        ],
                      ),

                    ],
                  );
                }),
          );
        }
    );
  }
}
