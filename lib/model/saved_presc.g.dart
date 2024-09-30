// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_presc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SavedPrescriptionImpl _$$SavedPrescriptionImplFromJson(
        Map<String, dynamic> json) =>
    _$SavedPrescriptionImpl(
      Prescription_id: json['Prescription_id'] as String?,
      Doctor_Notes: json['Doctor_Notes'] as String?,
      Drug_id: json['Drug_id'] as num?,
      dosage: json['dosage'] as String?,
      Drug_Name: json['Drug_Name'] as String?,
      Days: json['Days'] as String?,
      Instruction: json['Instruction'] as String?,
      Frequency: json['Frequency'] as String?,
      Food: json['Food'] as String?,
      Morning: json['Morning'] as String?,
      Afternoon: json['Afternoon'] as String?,
      Night: json['Night'] as String?,
      MorningTime: json['MorningTime'] as String?,
      AfternoonTime: json['AfternoonTime'] as String?,
      NightTime: json['NightTime'] as String?,
      Pres_Name: json['Pres_Name'] as String?,
      ListPresc: (json['ListPresc'] as List<dynamic>?)
              ?.map(
                  (e) => SavedPrescription.fromJson(e as Map<String, dynamic>))
              .toList() ??
          null,
    );

Map<String, dynamic> _$$SavedPrescriptionImplToJson(
        _$SavedPrescriptionImpl instance) =>
    <String, dynamic>{
      'Prescription_id': instance.Prescription_id,
      'Doctor_Notes': instance.Doctor_Notes,
      'Drug_id': instance.Drug_id,
      'dosage': instance.dosage,
      'Drug_Name': instance.Drug_Name,
      'Days': instance.Days,
      'Instruction': instance.Instruction,
      'Frequency': instance.Frequency,
      'Food': instance.Food,
      'Morning': instance.Morning,
      'Afternoon': instance.Afternoon,
      'Night': instance.Night,
      'MorningTime': instance.MorningTime,
      'AfternoonTime': instance.AfternoonTime,
      'NightTime': instance.NightTime,
      'Pres_Name': instance.Pres_Name,
      'ListPresc': instance.ListPresc,
    };
