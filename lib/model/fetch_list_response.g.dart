// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FetchListResponse _$FetchListResponseFromJson(Map<String, dynamic> json) =>
    FetchListResponse(
      json['ResponseMessage'] as String?,
      json['ResponseCode'],
      json['Data'],
      json['data'],
    );

Map<String, dynamic> _$FetchListResponseToJson(FetchListResponse instance) =>
    <String, dynamic>{
      'ResponseMessage': instance.message,
      'ResponseCode': instance.code,
      'Data': instance.data,
      'data': instance.payload,
    };
