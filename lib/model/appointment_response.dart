import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:timesmedlite/model/appointment_data.dart';

part 'appointment_response.freezed.dart';
part 'appointment_response.g.dart';

@freezed
class AppointmentResponse with _$AppointmentResponse {
  const factory AppointmentResponse({
    @JsonKey(name: 'PreviousAppointmentList') List<AppointmentData>? previous,
    @JsonKey(name: 'UpcomingAppointmentList') List<AppointmentData>? upcoming,
  }) = _AppointmentResponse;
  static const fromJsonFactory = _$AppointmentResponseFromJson;
  factory AppointmentResponse.fromJson(Map<String, dynamic> json) =>
      _$AppointmentResponseFromJson(json);
}
