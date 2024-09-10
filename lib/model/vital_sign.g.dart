// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vital_sign.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_VitalSign _$$_VitalSignFromJson(Map<String, dynamic> json) => _$_VitalSign(
      preparedName: json['prepared_name'] as String?,
      admissionId: json['admission_id'] as int?,
      saturation: json['Saturation'] as String?,
      diastolic: json['Diastolic'] as String?,
      systolic: json['Systolic'] as String?,
      id: json['id'] as int?,
      date: json['date'] as String?,
      time: json['time'] as String?,
      patientId: json['patient_id'] as int?,
      doctorId: json['doctor_id'] as int?,
      pulseRate: json['pulse_rate'] as String?,
      temperature: json['temperature'] as String?,
      respiration: json['respiration'] as String?,
      height: json['height'] as String?,
      weight: json['weight'] as String?,
    );

Map<String, dynamic> _$$_VitalSignToJson(_$_VitalSign instance) =>
    <String, dynamic>{
      'prepared_name': instance.preparedName,
      'admission_id': instance.admissionId,
      'Saturation': instance.saturation,
      'Diastolic': instance.diastolic,
      'Systolic': instance.systolic,
      'id': instance.id,
      'date': instance.date,
      'time': instance.time,
      'patient_id': instance.patientId,
      'doctor_id': instance.doctorId,
      'pulse_rate': instance.pulseRate,
      'temperature': instance.temperature,
      'respiration': instance.respiration,
      'height': instance.height,
      'weight': instance.weight,
    };
