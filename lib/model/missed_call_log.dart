import 'package:freezed_annotation/freezed_annotation.dart';

part 'missed_call_log.freezed.dart';
part 'missed_call_log.g.dart';

@freezed
class MissedCallLog with _$MissedCallLog {
  const factory MissedCallLog({
  @Default('') dynamic User_id,
  @Default('') dynamic User_Name,
  @Default('') dynamic Appointment_Date,
  @Default('') dynamic Appointment_Time,
  @Default('') dynamic Appointment_id,
  @Default('') dynamic MobileNumber,
  @Default('') dynamic Doctor_id,
  @Default('') dynamic transaction_status,
  @Default('') dynamic PatientImage
  }) = _MissedCallLog;
  static const fromJsonFactory = _$MissedCallLogFromJson;
  factory MissedCallLog.fromJson(Map<String, dynamic> json) =>
      _$MissedCallLogFromJson(json);
}

