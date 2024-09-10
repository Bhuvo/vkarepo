// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TimeListResponse _$$_TimeListResponseFromJson(Map<String, dynamic> json) =>
    _$_TimeListResponse(
      timeList: (json['TimeList'] as List<dynamic>?)
          ?.map((e) => TimeList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_TimeListResponseToJson(_$_TimeListResponse instance) =>
    <String, dynamic>{
      'TimeList': instance.timeList,
    };
