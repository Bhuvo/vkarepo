import 'package:freezed_annotation/freezed_annotation.dart';

part 'saved_presc.freezed.dart';
part 'saved_presc.g.dart';

@freezed
class SavedPrescription with _$SavedPrescription {
  const factory SavedPrescription({
    String? Prescription_id,
    String? Doctor_Notes,
    num? Drug_id,
    String? dosage,
    String? Drug_Name,
    String? Days,
    String? Instruction,
    String? Frequency,
    String? Food,
    String? Morning,
    String? Afternoon,
    String? Night,
    String? MorningTime,
    String? AfternoonTime,
    String? NightTime,
    String? Pres_Name,
    @Default(null) List<SavedPrescription>? ListPresc,

  }) = _SavedPrescription;
  static const fromJsonFactory = _$SavedPrescriptionFromJson;
  factory SavedPrescription.fromJson(Map<String, dynamic> json) =>
      _$SavedPrescriptionFromJson(json);
}

// {
// "Doctor_Notes": "",
// "Drug_id": 11784,
// "dosage": "1",
// "Drug_Name": "DOLOPAR M 60ML SUSPENSION ",
// "Days": "1",
// "Instruction": "",
// "Frequency": "1-0-0-0",
// "Food": "Before Food",
// "Morning": "1",
// "Afternoon": "0",
// "Night": "0",
// "MorningTime": "08:00:00",
// "AfternoonTime": "00:00:00",
// "NightTime": "00:00:00",
// "Pres_Name": "",
// "ListPresc": null
// },