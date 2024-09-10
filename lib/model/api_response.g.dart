// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ApiResponse _$$_ApiResponseFromJson(Map<String, dynamic> json) =>
    _$_ApiResponse(
      message: json['ResponseMessage'] as String?,
      Rmessage: json['Message'],
      Rkey: json['Key'],
      code: json['ResponseCode'],
      Rcode: json['Responsecode'],
      R: json['R'],
      data: json['Data'] ?? null,
    );

Map<String, dynamic> _$$_ApiResponseToJson(_$_ApiResponse instance) =>
    <String, dynamic>{
      'ResponseMessage': instance.message,
      'Message': instance.Rmessage,
      'Key': instance.Rkey,
      'ResponseCode': instance.code,
      'Responsecode': instance.Rcode,
      'R': instance.R,
      'Data': instance.data,
    };
