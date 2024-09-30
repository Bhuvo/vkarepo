// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TimeListResponseImpl _$$TimeListResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$TimeListResponseImpl(
      timeList: (json['TimeList'] as List<dynamic>?)
          ?.map((e) => TimeList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$TimeListResponseImplToJson(
        _$TimeListResponseImpl instance) =>
    <String, dynamic>{
      'TimeList': instance.timeList,
    };
