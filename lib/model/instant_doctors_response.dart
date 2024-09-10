import 'package:freezed_annotation/freezed_annotation.dart';
import 'clinic.dart';
import 'instant_doctor.dart';

part 'instant_doctors_response.freezed.dart';
part 'instant_doctors_response.g.dart';

@freezed
class InstantDoctorsResponse with _$InstantDoctorsResponse {
  const factory InstantDoctorsResponse({
    @JsonKey(name: 'DFSendList') List<InstantDoctor>? doctors,
    @JsonKey(name: 'ClinicFee') List<Clinic>? clinics,
  }) = _InstantDoctorsResponse;
  static const fromJsonFactory = _$InstantDoctorsResponseFromJson;
  factory InstantDoctorsResponse.fromJson(Map<String, dynamic> json) =>
      _$InstantDoctorsResponseFromJson(json);
}
