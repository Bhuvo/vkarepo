import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:livekit_client/livekit_client.dart';
import 'package:timesmedlite/service/feb_rtc/feb_rtc_peer.dart';
import 'package:timesmedlite/service/feb_rtc/feb_rtc_sdk.dart';
import 'package:timesmedlite/ui/providers/webrtc_service_provider.dart';
import 'package:timesmedlite/ui/widgets/local_size_builder.dart';

class ParticipantTrack {
  ParticipantTrack(
      {required this.participant,
      required this.videoTrack,
      required this.isScreenShare});

  VideoTrack? videoTrack;
  Participant participant;
  final bool isScreenShare;
}

class ParticipantInfoWidget extends StatelessWidget {
  //
  final String? title;
  final bool audioAvailable;
  final ConnectionQuality connectionQuality;
  final bool isScreenShare;
  final bool enabledE2EE;
  final FebRtcPeerValue? value;
  final bool active, local;

  const ParticipantInfoWidget({
    this.title,
    this.audioAvailable = true,
    this.connectionQuality = ConnectionQuality.unknown,
    this.isScreenShare = false,
    this.enabledE2EE = false,
    this.value,
    this.active = true,
    this.local = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = value?.config.user;
    final service = WebRTCServiceProvider.of(context);
    return LocalSizeBuilder(
      builder: (context, size) {
        double? fontSize;
        double iconSize = 16;

        if(size.width < 100){
          fontSize = 8;
          iconSize = 8;
        }

        return ValueListenableBuilder(
            valueListenable: service ?? ValueNotifier(FebRtcSdkValue(userId: '')),
            builder: (context, v, _) {
              return Container(
                // color: Colors.black.withOpacity(0.1),
                padding: const EdgeInsets.symmetric(
                  vertical: 4,
                  horizontal: 8,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // if (user != null && active)
                    //   Flexible(
                    //     child: AutoSizeText(
                    //       (kFlavour == Flavour.messenger
                    //               ? (user.display)
                    //               : user.uname) ??
                    //           user.phone ??
                    //           'User ${user.id}',
                    //       minFontSize: 4,
                    //       maxLines: 1,
                    //       overflow: TextOverflow.fade,
                    //       style:  TextStyle(
                    //           fontWeight: FontWeight.bold,
                    //           color: Colors.white,
                    //           fontSize: fontSize,
                    //           shadows: const [
                    //             Shadow(
                    //               color: Colors.black,
                    //               blurRadius: 5,
                    //             )
                    //           ]),
                    //     ),
                    //   ),
                    // if ((value?.config.hand ?? false) || ((v.config.hand) && local))
                    //   Container(
                    //       decoration: const BoxDecoration(
                    //         color: Colors.white,
                    //         shape: BoxShape.circle,
                    //       ),
                    //       padding: const EdgeInsets.all(4),
                    //       margin: const EdgeInsets.all(8),
                    //       child:  Icon(
                    //         Icons.front_hand_rounded,
                    //         color: Colors.amber,
                    //         size: iconSize,
                    //       ))
                    // else
                    //   const Space(8),
                    isScreenShare
                        ? Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Icon(
                              Icons.monitor,
                              color: Colors.white,
                              size: iconSize,
                            ),
                          )
                        : Container(
                            decoration: BoxDecoration(
                              color: Colors.black,
                              shape: BoxShape.circle,
                            ),
                            padding: const EdgeInsets.all(4),
                            margin: const EdgeInsets.all(8),
                            child: Icon(
                              audioAvailable ? Icons.mic : Icons.mic_off,
                              color: Colors.white,
                              size: iconSize,
                            )),
                    if (connectionQuality == ConnectionQuality.poor)
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Icon(
                          Icons.circle,
                          color: {
                            ConnectionQuality.excellent: Colors.transparent,
                            ConnectionQuality.good: Colors.transparent,
                            ConnectionQuality.poor: Colors.red,
                          }[connectionQuality],
                          size: 8,
                        ),
                      ),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 5),
                    //   child: Icon(
                    //     enabledE2EE ? Icons.lock : Icons.lock_open,
                    //     color: enabledE2EE ? Colors.green : Colors.red,
                    //     size: 16,
                    //   ),
                    // ),
                  ],
                ),
              );
            });
      }
    );
  }
}
