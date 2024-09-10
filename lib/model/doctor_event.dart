
import 'package:freezed_annotation/freezed_annotation.dart';

part 'doctor_event.freezed.dart';
part 'doctor_event.g.dart';

@freezed
class DoctorEvent with _$DoctorEvent {
  const factory DoctorEvent({
    @Default(null) dynamic id,
    @Default(null) dynamic title,
    @Default(null) dynamic s_date,
    @Default(null) dynamic e_date,
    @Default(null) dynamic description,
    @Default(null) dynamic y,
    @Default(null) dynamic m,
    @Default(null) dynamic d,
    @Default(null) dynamic h,
    @Default(null) dynamic s,
    @Default(null) dynamic timeinterval,
    @Default(null) dynamic appid,
    @Default(null) dynamic type_flag,
    @Default(null) dynamic Pay_Status,
    @Default(null) dynamic Hospital_Name
  }) = _DoctorEvent;
  static const fromJsonFactory = _$DoctorEventFromJson;
  factory DoctorEvent.fromJson(Map<String, dynamic> json) =>
      _$DoctorEventFromJson(json);
}
