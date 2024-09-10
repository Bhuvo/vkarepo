// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FetchListResponse _$$_FetchListResponseFromJson(Map<String, dynamic> json) =>
    _$_FetchListResponse(
      message: json['ResponseMessage'] as String?,
      code: json['ResponseCode'] ?? null,
      data: json['Data'] ?? const [],
      payload: json['data'] ?? const [],
    );

Map<String, dynamic> _$$_FetchListResponseToJson(
        _$_FetchListResponse instance) =>
    <String, dynamic>{
      'ResponseMessage': instance.message,
      'ResponseCode': instance.code,
      'Data': instance.data,
      'data': instance.payload,
    };
