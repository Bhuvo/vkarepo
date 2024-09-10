// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TimeList _$$_TimeListFromJson(Map<String, dynamic> json) => _$_TimeList(
      Clinic_id: json['Clinic_id'] ?? '',
      FromTime: json['FromTime'] ?? '',
      Doctor_id: json['Doctor_id'] ?? '',
      startSplit: json['startSplit'] ?? '',
      EndSplit: json['EndSplit'] ?? '',
      ToTime: json['ToTime'] ?? '',
      Day: json['Day'] ?? '',
      Days: json['Days'] ?? '',
      Dayslot: json['Dayslot'] ?? '',
      Class: json['Class'] ?? '',
    );

Map<String, dynamic> _$$_TimeListToJson(_$_TimeList instance) =>
    <String, dynamic>{
      'Clinic_id': instance.Clinic_id,
      'FromTime': instance.FromTime,
      'Doctor_id': instance.Doctor_id,
      'startSplit': instance.startSplit,
      'EndSplit': instance.EndSplit,
      'ToTime': instance.ToTime,
      'Day': instance.Day,
      'Days': instance.Days,
      'Dayslot': instance.Dayslot,
      'Class': instance.Class,
    };
