// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vital_sign.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VitalSignImpl _$$VitalSignImplFromJson(Map<String, dynamic> json) =>
    _$VitalSignImpl(
      preparedName: json['prepared_name'] as String?,
      admissionId: (json['admission_id'] as num?)?.toInt(),
      saturation: json['Saturation'] as String?,
      diastolic: json['Diastolic'] as String?,
      systolic: json['Systolic'] as String?,
      id: (json['id'] as num?)?.toInt(),
      date: json['date'] as String?,
      time: json['time'] as String?,
      patientId: (json['patient_id'] as num?)?.toInt(),
      doctorId: (json['doctor_id'] as num?)?.toInt(),
      pulseRate: json['pulse_rate'] as String?,
      temperature: json['temperature'] as String?,
      respiration: json['respiration'] as String?,
      height: json['height'] as String?,
      weight: json['weight'] as String?,
    );

Map<String, dynamic> _$$VitalSignImplToJson(_$VitalSignImpl instance) =>
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
