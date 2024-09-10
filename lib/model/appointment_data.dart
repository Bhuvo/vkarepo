import 'package:freezed_annotation/freezed_annotation.dart';

part 'appointment_data.freezed.dart';

part 'appointment_data.g.dart';

@freezed
class AppointmentData with _$AppointmentData {
  const factory AppointmentData({
    @JsonKey(name: 'Type') String? type,
    @JsonKey(name: 'FreeReview') int? freeReview,
    @JsonKey(name: 'Appointment_id') int? id,
    @JsonKey(name: 'Appointment_Date') String? date,
    @JsonKey(name: 'Appointment_Time') String? time,
    @JsonKey(name: 'Doctor_id') int? doctorId,
    @JsonKey(name: 'Doctor_Name') String? doctorName,
    @JsonKey(name: 'DoctorCategory_Name') String? doctorCategory,
    @JsonKey(name: 'Doctor_Image') String? doctorImage,
    @JsonKey(name: 'City_Name') String? cityName,
    @JsonKey(name: 'InstantURL') String? instantURL,
    @JsonKey(name: 'ScheduleURL') String? scheduleURL,
    @JsonKey(name: 'eclinic_Flag') @Default(null) dynamic eClinicFlag,
  }) = _AppointmentData;

  static const fromJsonFactory = _$AppointmentDataFromJson;

  factory AppointmentData.fromJson(Map<String, dynamic> json) =>
      _$AppointmentDataFromJson(json);
}
