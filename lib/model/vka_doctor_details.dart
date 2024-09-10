import 'package:freezed_annotation/freezed_annotation.dart';

part 'vka_doctor_details.freezed.dart';
part 'vka_doctor_details.g.dart';

@freezed
class VkaDoctorDetails with _$VkaDoctorDetails {
  const factory VkaDoctorDetails({

     int? doctorId,
     String? name,
    @Default(null) dynamic qualification,
    @Default(null) dynamic hospitalName,
     String? phoneNumber,
    @Default(null) dynamic watsappNumber,
     String? hospitalNumber,
     String? eMailId,
    @Default(null) dynamic password,
    @Default(null) dynamic activeFlag,
    @Default(null) List<VkaDoctorDetails>? doctorRegistrationList,

  }) = _VkaDoctorDetails;
  static const fromJsonFactory = _$VkaDoctorDetailsFromJson;
  factory VkaDoctorDetails.fromJson(Map<String, dynamic> json) =>
      _$VkaDoctorDetailsFromJson(json);
}








