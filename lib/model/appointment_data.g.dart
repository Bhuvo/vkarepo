// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AppointmentData _$$_AppointmentDataFromJson(Map<String, dynamic> json) =>
    _$_AppointmentData(
      type: json['Type'] as String?,
      freeReview: json['FreeReview'] as int?,
      id: json['Appointment_id'] as int?,
      date: json['Appointment_Date'] as String?,
      time: json['Appointment_Time'] as String?,
      doctorId: json['Doctor_id'] as int?,
      doctorName: json['Doctor_Name'] as String?,
      doctorCategory: json['DoctorCategory_Name'] as String?,
      doctorImage: json['Doctor_Image'] as String?,
      cityName: json['City_Name'] as String?,
      instantURL: json['InstantURL'] as String?,
      scheduleURL: json['ScheduleURL'] as String?,
      eClinicFlag: json['eclinic_Flag'] ?? null,
    );

Map<String, dynamic> _$$_AppointmentDataToJson(_$_AppointmentData instance) =>
    <String, dynamic>{
      'Type': instance.type,
      'FreeReview': instance.freeReview,
      'Appointment_id': instance.id,
      'Appointment_Date': instance.date,
      'Appointment_Time': instance.time,
      'Doctor_id': instance.doctorId,
      'Doctor_Name': instance.doctorName,
      'DoctorCategory_Name': instance.doctorCategory,
      'Doctor_Image': instance.doctorImage,
      'City_Name': instance.cityName,
      'InstantURL': instance.instantURL,
      'ScheduleURL': instance.scheduleURL,
      'eclinic_Flag': instance.eClinicFlag,
    };
