// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'missed_call_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MissedCallLogImpl _$$MissedCallLogImplFromJson(Map<String, dynamic> json) =>
    _$MissedCallLogImpl(
      User_id: json['User_id'] ?? '',
      User_Name: json['User_Name'] ?? '',
      Appointment_Date: json['Appointment_Date'] ?? '',
      Appointment_Time: json['Appointment_Time'] ?? '',
      Appointment_id: json['Appointment_id'] ?? '',
      MobileNumber: json['MobileNumber'] ?? '',
      Doctor_id: json['Doctor_id'] ?? '',
      transaction_status: json['transaction_status'] ?? '',
      PatientImage: json['PatientImage'] ?? '',
    );

Map<String, dynamic> _$$MissedCallLogImplToJson(_$MissedCallLogImpl instance) =>
    <String, dynamic>{
      'User_id': instance.User_id,
      'User_Name': instance.User_Name,
      'Appointment_Date': instance.Appointment_Date,
      'Appointment_Time': instance.Appointment_Time,
      'Appointment_id': instance.Appointment_id,
      'MobileNumber': instance.MobileNumber,
      'Doctor_id': instance.Doctor_id,
      'transaction_status': instance.transaction_status,
      'PatientImage': instance.PatientImage,
    };
