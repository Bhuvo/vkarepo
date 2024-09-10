import 'package:freezed_annotation/freezed_annotation.dart';

part 'waiting_patient.freezed.dart';

part 'waiting_patient.g.dart';

@freezed
class WaitingPatient with _$WaitingPatient {
  const factory WaitingPatient(
      {@Default(null) dynamic Online_Flag,
      @Default(null) dynamic Doctor_id,
      @Default(null) dynamic User_id,
      @Default(null) dynamic chat_id,
      @Default(null) dynamic chat_name,
      @Default(null) dynamic chattype_Flag,
      @Default(null) dynamic Type_Flag,
      @Default(null) dynamic Doctor_Image,
      @Default(null) dynamic Patient_Image,
      @Default(null) dynamic Doctor_Name,
      @Default(null) dynamic User_Name,
      @Default(null) dynamic Group_Name,
      @Default(null) dynamic Group_id,
      @Default(null) dynamic GroupMember_id,
      @Default(null) dynamic GroupMember_Name,
      @Default(null) dynamic Group_Image,
      @Default(null) dynamic MessageList,
      @Default(null) dynamic Image,
      @Default(null) dynamic EnableFlag,
      @Default(null) dynamic Appointment_id,
      @Default(null) dynamic Insert_Date,
      @Default(null) dynamic Seconds_Ago,
      @Default(null) dynamic Last_Seen,
      @Default(null) dynamic Appointment_Date,
      @Default(null) dynamic Appointment_Time,
      @Default(null) dynamic Key_Id,
      @Default(null) dynamic Mobile_Number,
      @Default(null) dynamic Email_Id}) = _WaitingPatient;

  static const fromJsonFactory = _$WaitingPatientFromJson;

  factory WaitingPatient.fromJson(Map<String, dynamic> json) =>
      _$WaitingPatientFromJson(json);
}
