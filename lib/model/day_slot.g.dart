// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day_slot.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DaySlot _$$_DaySlotFromJson(Map<String, dynamic> json) => _$_DaySlot(
      Time: json['Time'] ?? '',
      FromTime: json['FromTime'] ?? '',
      ToTime: json['ToTime'] ?? '',
      Day: (json['Day'] as List<dynamic>?)?.map((e) => e as String).toList(),
      Days_Name: json['Days_Name'] ?? '',
      Time_List: json['Time_List'] ?? '',
    );

Map<String, dynamic> _$$_DaySlotToJson(_$_DaySlot instance) =>
    <String, dynamic>{
      'Time': instance.Time,
      'FromTime': instance.FromTime,
      'ToTime': instance.ToTime,
      'Day': instance.Day,
      'Days_Name': instance.Days_Name,
      'Time_List': instance.Time_List,
    };
