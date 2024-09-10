import 'package:freezed_annotation/freezed_annotation.dart';

part 'vital_sign.freezed.dart';
part 'vital_sign.g.dart';

@freezed
class VitalSign with _$VitalSign {
  const factory VitalSign({
    @JsonKey(name: 'prepared_name') String? preparedName,
    @JsonKey(name: 'admission_id') int? admissionId,
    @JsonKey(name: 'Saturation') String? saturation,
    @JsonKey(name: 'Diastolic') String? diastolic,
    @JsonKey(name: 'Systolic') String? systolic,
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'date') String? date,
    @JsonKey(name: 'time') String? time,
    @JsonKey(name: 'patient_id') int? patientId,
    @JsonKey(name: 'doctor_id') int? doctorId,
    @JsonKey(name: 'pulse_rate') String? pulseRate,
    @JsonKey(name: 'temperature') String? temperature,
    @JsonKey(name: 'respiration') String? respiration,
    @JsonKey(name: 'height') String? height,
    @JsonKey(name: 'weight') String? weight,
  }) = _VitalSign;

  static const fromJsonFactory = _$VitalSignFromJson;

  factory VitalSign.fromJson(Map<String, dynamic> json) =>
      _$VitalSignFromJson(json);
}
