import 'package:freezed_annotation/freezed_annotation.dart';

part 'VitalModel.freezed.dart';
part 'VitalModel.g.dart';

@freezed
class VitalModel with _$VitalModel{

  const factory VitalModel({
    @JsonKey(name: 'Summary_id') int? summaryId,
    @JsonKey(name: 'Pulse') String? pulse,
    @JsonKey(name: 'Disease_name') String? diseaseName,
    @JsonKey(name: 'Allergies') String? allergies,
    @JsonKey(name: 'Symptoms') String? symptoms,
    @JsonKey(name: 'Height') String? height,
    @JsonKey(name: 'Weight') String? weight,
    @JsonKey(name: 'Temp') String? temp,
    @JsonKey(name: 'Diagnoses') String? diagnoses,
    @JsonKey(name: 'Causes') String? causes,
    @JsonKey(name: 'Investigation') String? investigation,
    @JsonKey(name: 'Notes') String? notes,
    @JsonKey(name: 'Doctor_id') int? doctorId,
    @JsonKey(name: 'Appointment_id') int? appointmentId,
    @JsonKey(name: 'User_id') int? userId,
    @JsonKey(name: 'Status_Flag') dynamic statusFlag,
    @JsonKey(name: 'Insert_Date') String? insertDate,
    @JsonKey(name: 'Diet_And_Exercise') String? dietAndExercise,
    @JsonKey(name: 'BP_Systolic') String? bpSystolic,
    @JsonKey(name: 'BP_Diastolic') String? bpDiastolic,
    @JsonKey(name: 'Waist') String? waist,
    @JsonKey(name: 'Hip') String? hip,
    @JsonKey(name: 'SPO2') String? spo2,
    @JsonKey(name: 'BMI') String? bmi,
    @JsonKey(name: 'Nurse_Id') int? nurseId,
    @JsonKey(name: 'Doctor_Flag') int? doctorFlag,
    @JsonKey(name: 'Nurse_Flag') int? nurseFlag,
    @JsonKey(name: 'Patient_Flag') int? patientFlag,
  }) = _VitalModel;

  static const fromJsonFactory = _$VitalModelFromJson;
  factory VitalModel.fromJson(Map<String, dynamic> json) => _$VitalModelFromJson(json);
}