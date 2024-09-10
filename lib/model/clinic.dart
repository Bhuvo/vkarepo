import 'package:freezed_annotation/freezed_annotation.dart';

import 'day_slot.dart';

part 'clinic.freezed.dart';
part 'clinic.g.dart';

@freezed
class Clinic with _$Clinic {
  const factory Clinic({
  @Default('') dynamic Location_Name_Temp,
  @Default('') dynamic URL_String,
  @Default('') dynamic Clinic_NameTemp,
  @Default('') dynamic Type_Flag,
  @Default('') dynamic Clinic_id,
  @Default('') dynamic Clinic_Name,
  @Default('') dynamic Clinic_Name_temp,
  @Default('') dynamic Clinic_Address,
  @Default('') dynamic SubCategory_id,
  @Default('') dynamic Location_id,
  @Default('') dynamic Location_name,
  @Default('') dynamic ClinicDoctorFee,
  @Default('') dynamic FromTime,
  @Default('') dynamic FeedBack,
  @Default('') dynamic Doctor_id,
  @Default('') dynamic startSplit,
  @Default('') dynamic EndSplit,
  @Default('') dynamic ToTime,
  @Default('') dynamic Day,
  @Default('') dynamic AboutClinic,
  @Default('') dynamic Clinic_Images,
  @Default('') dynamic CandHList,
  @Default('') dynamic Location_Name,
  @Default('') dynamic Days,
  @Default('') dynamic SubCategory_Name,
  @Default('') dynamic Class,
  @Default('') dynamic Link,
  @Default('') dynamic Banner_Id,
  @Default('') dynamic Banner_Image,
  @Default('') dynamic listbanner,
  @Default('') dynamic Timing,
  @Default('') dynamic PhoneNumber,
  @Default('') dynamic SerList,
  @Default('') dynamic SubCategoryList,
  @Default('') dynamic CImage,
  @Default('') dynamic LocationList,
  @Default('') dynamic Count,
  @Default('') dynamic count,
  @Default('') dynamic Lat,
  @Default('') dynamic longi,
  @Default('') dynamic Hospital_Speciliazation,
  @Default('') dynamic Hospital_Type,
  @Default('') dynamic Hospital_Address,
  @Default('') dynamic Currency,
  @Default('') dynamic City_Name,
  @Default('') dynamic Country_Name,
  @Default('') dynamic Hospital_URL_With_Name,
  @Default('') dynamic HospitalDetails_id,
  @Default('') dynamic user_id,
  @Default('') dynamic user_name,
  @Default('') dynamic user_image,
  @Default('') dynamic mobileno,
  @Default('') dynamic app_id,
  @Default('') dynamic view_flag,
    @JsonKey(name: 'DaySlot')List<DaySlot>? daySlot
  }) = _Clinic;
  static const fromJsonFactory = _$ClinicFromJson;
  factory Clinic.fromJson(Map<String, dynamic> json) =>
      _$ClinicFromJson(json);
}
