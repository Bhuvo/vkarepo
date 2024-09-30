// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DoctorEventImpl _$$DoctorEventImplFromJson(Map<String, dynamic> json) =>
    _$DoctorEventImpl(
      id: json['id'] ?? null,
      title: json['title'] ?? null,
      s_date: json['s_date'] ?? null,
      e_date: json['e_date'] ?? null,
      description: json['description'] ?? null,
      y: json['y'] ?? null,
      m: json['m'] ?? null,
      d: json['d'] ?? null,
      h: json['h'] ?? null,
      s: json['s'] ?? null,
      timeinterval: json['timeinterval'] ?? null,
      appid: json['appid'] ?? null,
      type_flag: json['type_flag'] ?? null,
      Pay_Status: json['Pay_Status'] ?? null,
      Hospital_Name: json['Hospital_Name'] ?? null,
    );

Map<String, dynamic> _$$DoctorEventImplToJson(_$DoctorEventImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      's_date': instance.s_date,
      'e_date': instance.e_date,
      'description': instance.description,
      'y': instance.y,
      'm': instance.m,
      'd': instance.d,
      'h': instance.h,
      's': instance.s,
      'timeinterval': instance.timeinterval,
      'appid': instance.appid,
      'type_flag': instance.type_flag,
      'Pay_Status': instance.Pay_Status,
      'Hospital_Name': instance.Hospital_Name,
    };
