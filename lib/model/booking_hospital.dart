import 'package:freezed_annotation/freezed_annotation.dart';

part 'booking_hospital.freezed.dart';
part 'booking_hospital.g.dart';

@freezed
class BookingHospital with _$BookingHospital {
  const factory BookingHospital({
  @Default(null) dynamic hospital_id,
  @Default(null) dynamic hospital_name,
  @Default(null) dynamic app_count,
  @Default(null) dynamic location,
  @Default(null) dynamic Virtual_Flag,
  @Default(null) dynamic Image_Name,
  @Default(null) dynamic Hospital_Address,
  @Default(null) dynamic Hospital_PhoneNumber,
  @Default(null) dynamic Timing,
  @Default(null) dynamic Header_Height,
  @Default(null) dynamic Footer_Height,
  @Default(null) dynamic User_Name,
  @Default(null) dynamic User_MobileNumber,
  @Default(null) dynamic Gender,
  @Default(null) dynamic C_DateTime,
  @Default(null) dynamic Doctor_Name,
  @Default(null) dynamic Doctor_Signature,
  @Default(null) dynamic User_id,
  @Default(null) dynamic Age,
  @Default(null) dynamic City_Name,
  @Default(null) dynamic lat,
  @Default(null) dynamic lng
  }) = _BookingHospital;
  static const fromJsonFactory = _$BookingHospitalFromJson;
  factory BookingHospital.fromJson(Map<String, dynamic> json) =>
      _$BookingHospitalFromJson(json);
}

