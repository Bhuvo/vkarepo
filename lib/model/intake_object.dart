import 'package:freezed_annotation/freezed_annotation.dart';

part 'intake_object.freezed.dart';
part 'intake_object.g.dart';

@freezed
class IntakeObject with _$IntakeObject {
  const factory IntakeObject({
  @Default(null) dynamic Saturation,
  @Default(null) dynamic Diastolic,
  @Default(null) dynamic Systolic,
  @Default(null) dynamic Stools,
  @Default(null) dynamic Bath,
  @Default(null) dynamic Outdata_Quantity,
  @Default(null) dynamic Urine,
  @Default(null) dynamic Vomit,
  @Default(null) dynamic Fesces,
  @Default(null) dynamic id,
  @Default(null) dynamic date,
  @Default(null) dynamic time,
  @Default(null) dynamic particular,
  @Default(null) dynamic fluids,
  @Default(null) dynamic oral,
  @Default(null) dynamic noof_stool,
  @Default(null) dynamic noof_urine,
  @Default(null) dynamic admission_id,
  @Default(null) dynamic patient_id,
  @Default(null) dynamic doctor_id,
  @Default(null) dynamic prepared_by,
  @Default(null) dynamic insertdate,
  @Default(null) dynamic prepared_name,
  @Default(null) dynamic focus,
  @Default(null) dynamic notes,
  @Default(null) dynamic pulse_rate,
  @Default(null) dynamic bp,
  @Default(null) dynamic temperature,
  @Default(null) dynamic respiration,
  @Default(null) dynamic height,
  @Default(null) dynamic weight,
  @Default(null) dynamic Descriptionofintake,
  @Default(null) dynamic Intake_Quantity,
  @Default(null) dynamic Oral_Diet,
  @Default(null) dynamic Oral_Medication
  }) = _IntakeObject;
  static const fromJsonFactory = _$IntakeObjectFromJson;
  factory IntakeObject.fromJson(Map<String, dynamic> json) =>
      _$IntakeObjectFromJson(json);
}