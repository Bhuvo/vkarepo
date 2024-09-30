// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clinical_note_loadsummary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClinicalNotesLoadSummaryImpl _$$ClinicalNotesLoadSummaryImplFromJson(
        Map<String, dynamic> json) =>
    _$ClinicalNotesLoadSummaryImpl(
      Summary_id: json['Summary_id'] ?? null,
      Pulse: json['Pulse'] ?? null,
      Disease_name: json['Disease_name'] as String?,
      Allergies: json['Allergies'] as String?,
      Symptoms: json['Symptoms'] as String?,
      Height: json['Height'] ?? null,
      Weight: json['Weight'] ?? null,
      Temp: json['Temp'] ?? null,
      Diagnoses: json['Diagnoses'] as String?,
      Causes: json['Causes'] as String?,
      Investigation: json['Investigation'] as String?,
      Notes: json['Notes'] as String?,
      Doctor_id: json['Doctor_id'] as num?,
      Appointment_id: json['Appointment_id'] as num?,
      User_id: json['User_id'] ?? null,
      Status_Flag: json['Status_Flag'] ?? null,
      Insert_Date: json['Insert_Date'] ?? null,
      ClincialList: (json['ClincialList'] as List<dynamic>?)
              ?.map((e) =>
                  ClinicalNotesLoadSummary.fromJson(e as Map<String, dynamic>))
              .toList() ??
          null,
    );

Map<String, dynamic> _$$ClinicalNotesLoadSummaryImplToJson(
        _$ClinicalNotesLoadSummaryImpl instance) =>
    <String, dynamic>{
      'Summary_id': instance.Summary_id,
      'Pulse': instance.Pulse,
      'Disease_name': instance.Disease_name,
      'Allergies': instance.Allergies,
      'Symptoms': instance.Symptoms,
      'Height': instance.Height,
      'Weight': instance.Weight,
      'Temp': instance.Temp,
      'Diagnoses': instance.Diagnoses,
      'Causes': instance.Causes,
      'Investigation': instance.Investigation,
      'Notes': instance.Notes,
      'Doctor_id': instance.Doctor_id,
      'Appointment_id': instance.Appointment_id,
      'User_id': instance.User_id,
      'Status_Flag': instance.Status_Flag,
      'Insert_Date': instance.Insert_Date,
      'ClincialList': instance.ClincialList,
    };
