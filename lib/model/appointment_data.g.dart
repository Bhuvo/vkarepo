// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppointmentDataImpl _$$AppointmentDataImplFromJson(
        Map<String, dynamic> json) =>
    _$AppointmentDataImpl(
      type: json['Type'] as String?,
      freeReview: (json['FreeReview'] as num?)?.toInt(),
      id: (json['Appointment_id'] as num?)?.toInt(),
      date: json['Appointment_Date'] as String?,
      time: json['Appointment_Time'] as String?,
      doctorId: (json['Doctor_id'] as num?)?.toInt(),
      doctorName: json['Doctor_Name'] as String?,
      doctorCategory: json['DoctorCategory_Name'] as String?,
      doctorImage: json['Doctor_Image'] as String?,
      cityName: json['City_Name'] as String?,
      instantURL: json['InstantURL'] as String?,
      scheduleURL: json['ScheduleURL'] as String?,
      confirmStatus: json['Confirm_Status'] as String?,
      eClinicFlag: json['eclinic_Flag'] ?? null,
    );

Map<String, dynamic> _$$AppointmentDataImplToJson(
        _$AppointmentDataImpl instance) =>
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
      'Confirm_Status': instance.confirmStatus,
      'eclinic_Flag': instance.eClinicFlag,
    };
