import 'package:freezed_annotation/freezed_annotation.dart';

part 'instant_doctor.freezed.dart';
part 'instant_doctor.g.dart';

@freezed
class InstantDoctor with _$InstantDoctor {
  const factory InstantDoctor({
  @Default('') dynamic RelationShipList,
  @Default('') dynamic BookCheck,
  @Default('') dynamic Registrations,
  @Default('') dynamic Doctor_Qualification,
  @Default('') dynamic Gender,
  @Default('') dynamic Doctor_ExperienceYears,
  @Default('') dynamic Wallet_Amount,
  @Default('') dynamic Coupon_Amount,
  @Default('') dynamic Consultation_Amount,
  @Default('') dynamic Service_Charges,
  @Default('') dynamic Discount_Name,
  @Default('') dynamic Discount_Id,
  @Default('') dynamic Discount_Amount,
  @Default('') dynamic Timing,
  @Default('') dynamic Favorite,
  @Default('') dynamic PaymentGateway,
  @Default('') dynamic Hospital_Name,
  @Default('') dynamic Doctor_Name,
  @Default('') dynamic eclinicVideo,
  @Default('') dynamic Language_Name,
  @Default('') dynamic city_name,
  @Default('') dynamic Doctor_id,
  @Default('') dynamic Minutes,
  @Default('') dynamic CNT,
  @Default('') dynamic Queue_id,
  @Default('') dynamic QueueList,
  @Default('') dynamic Image,
  @Default('') dynamic DFSendList,
  @Default('') dynamic Hospital_Banner_Image,
  @Default('') dynamic Text_Color,
  @Default('') dynamic Color_1,
  @Default('') dynamic Color_2,
  @Default('') dynamic ClinicFee,
  @Default('') dynamic Eclinic_Flag,
  @Default(null) dynamic Eclinic_Charges,
  @Default(null) dynamic Fee,
  @Default('') dynamic Eclinic_Booking_Charges,
  @Default('') dynamic Doctor_Designation,
  @Default('') dynamic Coupon_Flag,
  @Default('') dynamic Second_Image,
  @Default('') dynamic Token_Number,
  @Default('') dynamic Waiting_Time
  }) = _InstantDoctor;
  static const fromJsonFactory = _$InstantDoctorFromJson;
  factory InstantDoctor.fromJson(Map<String, dynamic> json) =>
      _$InstantDoctorFromJson(json);
}
