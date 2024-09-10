import 'package:freezed_annotation/freezed_annotation.dart';

part 'clinical_note_loadsummary.freezed.dart';
part 'clinical_note_loadsummary.g.dart';

@freezed
class ClinicalNotesLoadSummary with _$ClinicalNotesLoadSummary {
  const factory ClinicalNotesLoadSummary({

    @Default(null) dynamic Summary_id,
    @Default(null) dynamic Pulse,
    String? Disease_name,
    String? Allergies,
    String? Symptoms,
    @Default(null) dynamic Height,
    @Default(null) dynamic Weight,
    @Default(null) dynamic Temp,
    String? Diagnoses,
    String? Causes,
    String? Investigation,
    String? Notes,
    num? Doctor_id,
    num? Appointment_id,
    @Default(null) dynamic User_id,
    @Default(null) dynamic Status_Flag,
    @Default(null) dynamic Insert_Date,
    @Default(null) List<ClinicalNotesLoadSummary>? ClincialList,

  }) = _ClinicalNotesLoadSummary;
  static const fromJsonFactory = _$ClinicalNotesLoadSummaryFromJson;
  factory ClinicalNotesLoadSummary.fromJson(Map<String, dynamic> json) =>
      _$ClinicalNotesLoadSummaryFromJson(json);
}

// {
// "Summary_id": 11697,
// "Pulse": "25",
// "Disease_name": "Fevers by themselves may not be a cause for alarm — or a reason to call a doctor. Yet there are some circumstances when you should seek medical advice for your baby, your child or yourself",
// "Allergies": "Fevers by themselves may not be a cause for alarm — or a reason to call a doctor. Yet there are some circumstances when you should seek medical advice for your baby, your child or yourself",
// "Symptoms": "Fevers by themselves may not be a cause for alarm — or a reason to call a doctor. Yet there are some circumstances when you should seek medical advice for your baby, your child or yourself",
// "Height": "170",
// "Weight": "60",
// "Temp": "90",
// "Diagnoses": "Fevers by themselves may not be a cause for alarm — or a reason to call a doctor. Yet there are some circumstances when you should seek medical advice for your baby, your child or yourself",
// "Causes": "Fevers by themselves may not be a cause for alarm — or a reason to call a doctor. Yet there are some circumstances when you should seek medical advice for your baby, your child or yourself",
// "Investigation": "Fevers by themselves may not be a cause for alarm — or a reason to call a doctor. Yet there are some circumstances when you should seek medical advice for your baby, your child or yourself",
// "Notes": "Fevers by themselves may not be a cause for alarm — or a reason to call a doctor. Yet there are some circumstances when you should seek medical advice for your baby, your child or yourself",
// "Doctor_id": 0,
// "Appointment_id": 0,
// "User_id": 8628,
// "Status_Flag": null,
// "ClincialList": null
// },