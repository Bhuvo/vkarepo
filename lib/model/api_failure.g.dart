// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_failure.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ApiFailure _$$_ApiFailureFromJson(Map<String, dynamic> json) =>
    _$_ApiFailure(
      message: json['ResponseMessage'] as String?,
      code: json['ResponseCode'] as String?,
    );

Map<String, dynamic> _$$_ApiFailureToJson(_$_ApiFailure instance) =>
    <String, dynamic>{
      'ResponseMessage': instance.message,
      'ResponseCode': instance.code,
    };
