import 'package:flutter/cupertino.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';

import 'entity.dart';

class FebRtcPeer extends ValueNotifier<FebRtcPeerValue> {
  MediaStream? localStream;
  MediaStream? remoteStream;
  RTCVideoRenderer renderer = RTCVideoRenderer();

  RTCPeerConnection? rtcPeerConnection;
  VoidCallback? onConnected, onStreamChanged;
  Function(RTCPeerConnectionState)? onConnectionStateChanged;
  Function(RTCIceCandidate) onIceCandidate;
  Function(RTCPeerConnection)? onRenegotiationNeeded;

  final FebRtcPeerConfig initialConfig;

  FebRtcPeer(
      {required this.localStream,
      this.onConnected,
      required this.initialConfig,
      required this.onRenegotiationNeeded,
      required this.onIceCandidate,
      this.onConnectionStateChanged})
      : super(FebRtcPeerValue(config: initialConfig));

  final Map<String, dynamic> configuration = {
    'sdpSemantics': 'plan-b',
    'iceServers': [
      {
        "urls": [
          "stun:webturn.focus.ind.in:443",
          "stun:webturn.focus.ind.in:3478"
        ]
      },
      {
        "urls": [
          "turn:webturn.focus.ind.in:443",
          "turn:webturn.focus.ind.in:3478"
        ],
        "username": "admin",
        "password": "admin112",
        "credential": "admin112",
        "maxRatekbps": "4000"
      }
    ]
  };
  final Map<String, dynamic> loopbackConstraints = {
    "mandatory": {},
    "optional": [
      {"DtlsSrtpKeyAgreement": true},
    ],
  };

  final Map<String, dynamic> offerSdpConstraints = {
    "mandatory": {
      "OfferToReceiveAudio": true,
      "OfferToReceiveVideo": true,
    },
    "optional": [],
  };

  Future<void> start() async {
    rtcPeerConnection =
        await createPeerConnection(configuration, loopbackConstraints);
    if (rtcPeerConnection?.getConfiguration['sdpSemantics'] == 'plan-b') {
      if (localStream != null) {
        rtcPeerConnection!.addStream(localStream!);
      }
    } else {
      final res = localStream?.getTracks();
      for (final e in res ?? []) {
        rtcPeerConnection!.addTrack(e);
      }
    }

    rtcPeerConnection!.onAddTrack = _onAddTrack;
    rtcPeerConnection!.onRemoveTrack = _onRemoveTrack;
    rtcPeerConnection!.onAddStream = _onAddStream;
    rtcPeerConnection!.onRemoveStream = _onRemoveStream;
    rtcPeerConnection!.onRenegotiationNeeded = () {
      onRenegotiationNeeded?.call(rtcPeerConnection!);
    };
    rtcPeerConnection!.onIceCandidate = (candidate) {
      onIceCandidate.call(candidate);
      onConnectionStateChanged
          ?.call(RTCPeerConnectionState.RTCPeerConnectionStateConnected);
      notifyListeners();
    };
    rtcPeerConnection!.onConnectionState = onConnectionStateChanged;
    await renderer.initialize();
    onConnected?.call();
    notifyListeners();
  }

  updateStream(MediaStream stream) async {
    try {
      // rtcPeerConnection!.getRemoteStreams().clear();
      // rtcPeerConnection!.addStream(stream);

      (await rtcPeerConnection?.senders)?.forEach((sender) {
        if (sender.track!.kind == 'video') {
          sender.replaceTrack(stream.getVideoTracks()[0]);
        }
      });

      localStream = stream;
    } catch (e) {
      print(e);
    }
  }

  void _onAddTrack(MediaStream stream, MediaStreamTrack track) {
    remoteStream = stream;
    renderer.srcObject = stream;
    onStreamChanged?.call();
    notifyListeners();
  }

  void _onRemoveTrack(MediaStream stream, MediaStreamTrack track) {
    remoteStream = null;
    notifyListeners();
  }

  void _onAddStream(MediaStream stream) {
    remoteStream = stream;
    renderer.srcObject = stream;
    onStreamChanged?.call();
    notifyListeners();
  }

  void _onRemoveStream(MediaStream stream) {
    remoteStream = null;
  }

  Future<RTCSessionDescription?> createOffer() async {
    try {
      final RTCSessionDescription sdp =
          await rtcPeerConnection!.createOffer(offerSdpConstraints);
      await rtcPeerConnection!.setLocalDescription(sdp);
      return sdp;
    } catch (error) {
      print(error);
    }
    return null;
  }

  Future<void> setOfferSdp(RTCSessionDescription sdp) async {
    if (rtcPeerConnection != null) {
      await rtcPeerConnection!.setRemoteDescription(sdp);
    }
  }

  Future<RTCSessionDescription> createAnswer() async {
    final RTCSessionDescription sdp =
        await rtcPeerConnection!.createAnswer(offerSdpConstraints);
    await rtcPeerConnection!.setLocalDescription(sdp);
    return sdp;
  }

  Future<void> setAnswerSdp(RTCSessionDescription sdp) async {
    if (rtcPeerConnection != null) {
      await rtcPeerConnection!.setRemoteDescription(sdp);
    }
  }

  Future<void> setCandidate(RTCIceCandidate candidate) async {
    if (rtcPeerConnection != null) {
      await rtcPeerConnection!.addCandidate(candidate);
    }
  }

  close() async {
    if (rtcPeerConnection != null) {
      await rtcPeerConnection!.close();
      rtcPeerConnection = null;
    }
    renderer.dispose();
    remoteStream?.dispose();
    remoteStream = null;
  }
}

class FebRtcPeerValue {
  FebRtcPeerConfig config;

  FebRtcPeerValue({required this.config});
}
