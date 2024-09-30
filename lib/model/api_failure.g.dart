// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_failure.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApiFailureImpl _$$ApiFailureImplFromJson(Map<String, dynamic> json) =>
    _$ApiFailureImpl(
      message: json['ResponseMessage'] as String?,
      code: json['ResponseCode'] as String?,
    );

Map<String, dynamic> _$$ApiFailureImplToJson(_$ApiFailureImpl instance) =>
    <String, dynamic>{
      'ResponseMessage': instance.message,
      'ResponseCode': instance.code,
    };
