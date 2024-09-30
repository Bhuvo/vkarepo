// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FetchListResponseImpl _$$FetchListResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$FetchListResponseImpl(
      message: json['ResponseMessage'] as String?,
      code: json['ResponseCode'] ?? null,
      data: json['Data'] ?? const [],
      payload: json['data'] ?? const [],
    );

Map<String, dynamic> _$$FetchListResponseImplToJson(
        _$FetchListResponseImpl instance) =>
    <String, dynamic>{
      'ResponseMessage': instance.message,
      'ResponseCode': instance.code,
      'Data': instance.data,
      'data': instance.payload,
    };
