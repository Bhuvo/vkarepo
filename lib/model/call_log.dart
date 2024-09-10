import 'package:freezed_annotation/freezed_annotation.dart';

part 'call_log.freezed.dart';
part 'call_log.g.dart';

@freezed
class CallLog with _$CallLog {
  const factory CallLog({
    @Default(null) dynamic CallStatus_Flag,
  @Default(null) dynamic CompNow_Flag,
  @Default(null) dynamic reApp_Date,
  @Default(null) dynamic reApp_Time,
  @Default(null) dynamic Mins,
  @Default(null) dynamic ApproximateEnd_Time,
  @Default(null) dynamic Hospital_id,
  @Default(null) dynamic LabStatus,
  @Default(null) dynamic ClinicalStatus,
  @Default(null) dynamic PresStatus,
  @Default(null) dynamic VideoCall_Status,
  @Default(null) dynamic Doctor_SettlementFlag,
  @Default(null) dynamic Doctor_SettlementAmount,
  @Default(null) dynamic Doctor_SettlementDate,
  @Default(null) dynamic Appointment_id,
  @Default(null) dynamic Appointment_Date,
  @Default(null) dynamic Appointment_Time,
  @Default(null) dynamic Order_id,
  @Default(null) dynamic User_Name,
  @Default(null) dynamic MobileNumber,
  @Default(null) dynamic User_id,
  @Default(null) dynamic Emailid,
  @Default(null) dynamic Order_Amount,
  @Default(null) dynamic Type,
  @Default(null) dynamic VideoorTextFlag,
  @Default(null) dynamic Payment_Mode,
  @Default(null) dynamic Transaction_Status,
  @Default(null) dynamic Call_Status,
  @Default(null) dynamic Key_id,
  @Default(null) dynamic CallendedBy_Patient
  }) = _CallLog;
  static const fromJsonFactory = _$CallLogFromJson;
  factory CallLog.fromJson(Map<String, dynamic> json) =>
      _$CallLogFromJson(json);
}

