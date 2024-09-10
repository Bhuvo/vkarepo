// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FebRtcPeerConfig _$FebRtcPeerConfigFromJson(Map<String, dynamic> json) =>
    FebRtcPeerConfig(
      video: json['video'] as bool? ?? false,
      voice: json['voice'] as bool? ?? false,
      screen: json['screen'] as bool? ?? false,
      face: json['face'] as bool? ?? false,
      hand: json['hand'] as bool? ?? false,
      userId: json['userId'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FebRtcPeerConfigToJson(FebRtcPeerConfig instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'video': instance.video,
      'voice': instance.voice,
      'screen': instance.screen,
      'face': instance.face,
      'hand': instance.hand,
      'user': instance.user,
    };
