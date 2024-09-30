// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApiResponseImpl _$$ApiResponseImplFromJson(Map<String, dynamic> json) =>
    _$ApiResponseImpl(
      message: json['ResponseMessage'] as String?,
      Rmessage: json['Message'],
      Rkey: json['Key'],
      code: json['ResponseCode'],
      Rcode: json['Responsecode'],
      R: json['R'],
      data: json['Data'] ?? null,
    );

Map<String, dynamic> _$$ApiResponseImplToJson(_$ApiResponseImpl instance) =>
    <String, dynamic>{
      'ResponseMessage': instance.message,
      'Message': instance.Rmessage,
      'Key': instance.Rkey,
      'ResponseCode': instance.code,
      'Responsecode': instance.Rcode,
      'R': instance.R,
      'Data': instance.data,
    };
