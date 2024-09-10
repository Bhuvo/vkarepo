import 'package:json_annotation/json_annotation.dart';
import 'package:timesmedlite/model/user.dart';

part 'entity.g.dart';

@JsonSerializable()
class FebRtcPeerConfig {
  String? userId;
  bool video, voice, screen, face, hand;
  User? user;
  FebRtcPeerConfig({
    this.video = false,
    this.voice = false,
    this.screen = false,
    this.face = false,
    this.hand = false,
    this.userId,
    this.user,
  });

  factory FebRtcPeerConfig.fromJson(Map<String, dynamic> json) => _$FebRtcPeerConfigFromJson(json);
  Map<String, dynamic> toJson() => _$FebRtcPeerConfigToJson(this);
}