import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_hospital_timing_by_doctor_hospital.freezed.dart';
part 'get_hospital_timing_by_doctor_hospital.g.dart';

@freezed
class GetHospitalTimingByDoctorHospital with _$GetHospitalTimingByDoctorHospital {
  const factory GetHospitalTimingByDoctorHospital({

    @JsonKey(name: 'VideoTiming_id')  int? videoTimingId,
    @JsonKey(name: 'Day') String? day,
    @JsonKey(name: 'Hospital_id') int? hospitalId,
    @JsonKey(name: 'Hospital_Name') @Default(null) dynamic hospitalName,
    @JsonKey(name: 'FromTime') String? fromTime,
    @JsonKey(name: 'ToTime') String? toTime,
    @JsonKey(name: 'Days_Get') @Default(null) dynamic daysGet,
    @JsonKey(name: 'Doctor_Image') @Default(null) dynamic doctorImage,
    @JsonKey(name: 'Doctor_Name') @Default(null) dynamic doctorName,
    @JsonKey(name: 'Doctor_id') int? doctorId,
    @JsonKey(name: 'DoctorFee')int? doctorFee,
    @JsonKey(name: 'SetInterval') int? setInterval,
    @JsonKey(name: 'Days') String? days,
    @JsonKey(name: 'HospitalDetails_id') int? hospitalDetailsId,
    @JsonKey(name: 'Status') @Default(null) dynamic status,
    @JsonKey(name: 'ListTiming') @Default(null) List<GetHospitalTimingByDoctorHospital>? listTiming,



  }) = _GetHospitalTimingByDoctorHospital;
  static const fromJsonFactory = _$GetHospitalTimingByDoctorHospitalFromJson;
  factory GetHospitalTimingByDoctorHospital.fromJson(Map<String, dynamic> json) =>
      _$GetHospitalTimingByDoctorHospitalFromJson(json);
}


