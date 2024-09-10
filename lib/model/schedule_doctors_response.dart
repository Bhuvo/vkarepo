import 'package:freezed_annotation/freezed_annotation.dart';
import 'clinic.dart';
import 'instant_doctor.dart';

part 'schedule_doctors_response.freezed.dart';
part 'schedule_doctors_response.g.dart';

@freezed
class ScheduleDoctorsResponse with _$ScheduleDoctorsResponse {
  const factory ScheduleDoctorsResponse({
    @JsonKey(name: 'DoctorInfo') List<InstantDoctor>? doctors,
    @JsonKey(name: 'ClinicFee') List<Clinic>? clinics,
  }) = _ScheduleDoctorsResponse;
  static const fromJsonFactory = _$ScheduleDoctorsResponseFromJson;
  factory ScheduleDoctorsResponse.fromJson(Map<String, dynamic> json) =>
      _$ScheduleDoctorsResponseFromJson(json);
}
