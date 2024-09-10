import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_doctor_details.freezed.dart';
part 'get_doctor_details.g.dart';

@freezed
class GetDoctorDetails with _$GetDoctorDetails {
  const factory GetDoctorDetails({

    @JsonKey(name: 'PRC_Number')   String? prcNumber,
    @JsonKey(name: 'City_Id') int? cityId,
    @JsonKey(name: 'City_Name') @Default(null) dynamic cityName,
    @JsonKey(name: 'Language_Name') @Default(null) dynamic languageName,
    @JsonKey(name: 'Language_Id') @Default(null) dynamic languageId,
    @JsonKey(name: 'Middle_Name')   String? middleName,
    @JsonKey(name: 'Last_Name') String? lastName,
    @JsonKey(name: 'URL') @Default(null) dynamic url,
    @JsonKey(name: 'Virtual') @Default(null) dynamic virtual,
    @JsonKey(name: 'Service') @Default(null) dynamic service,
    @JsonKey(name: 'Online') String? online,
    @JsonKey(name: 'AccountName')  String? accountName,
    @JsonKey(name: 'BankName') String? bankName,
    @JsonKey(name: 'AccountNo') String? accountNo,
    @JsonKey(name: 'BranchName') String? branchName,
    @JsonKey(name: 'IFSCCode') String? ifscCode,
    @JsonKey(name: 'Hospital_id')   int? hospitalId,
    @JsonKey(name: 'Hospital_Name') @Default(null) dynamic hospitalName,
    @JsonKey(name: 'Password') String? password,
    @JsonKey(name: 'Lat') @Default(null) int? lat,
    @JsonKey(name: 'DoctorCategory_id') int? doctorCategoryId,
    @JsonKey(name: 'DoctorCategory_Name')  String? doctorCategoryName,
    @JsonKey(name: 'file') @Default(null) @Default(null) dynamic file,
    @JsonKey(name: 'Long') int? long,
    @JsonKey(name: 'Location_Name') @Default(null) dynamic locationName,
    @JsonKey(name: 'Category') @Default(null) dynamic category,
    @JsonKey(name: 'Doctor_id') int? doctorId,
    @JsonKey(name: 'Doctor_Name') String? doctorName,
    @JsonKey(name: 'QualificationName') @Default(null) dynamic qualificationName,
    @JsonKey(name: 'Doctor_Qualification') String? doctorQualification,
    @JsonKey(name: 'Location_id')  int? locationId,
    @JsonKey(name: 'SubCategory_id') String? subCategoryId,
    @JsonKey(name: 'DoctorExperience_Years')  int? doctorExperienceYears,
    @JsonKey(name: 'Recommendations') int? recommendations,
    @JsonKey(name: 'Doctor_Description')  String? doctorDescription,
    @JsonKey(name: 'Doctor_Image') String? doctorImage,
    @JsonKey(name: 'Doctor_Age')   int? doctorAge,
    @JsonKey(name: 'Doctor_PhoneNumber') String? doctorPhoneNumber,
    @JsonKey(name: 'SubCategory_Name') @Default(null) dynamic subCategoryName,
    @JsonKey(name: 'Doctor_Address') String? doctorAddress,
    @JsonKey(name: 'ClinicDoctorFee')  int? clinicDoctorFee,
    @JsonKey(name: 'Type_Flag') @Default(null) dynamic typeFlag,
    @JsonKey(name: 'Days') @Default(null) dynamic days,
    @JsonKey(name: 'sscategory_Name') @Default(null) dynamic sscategoryName,
    @JsonKey(name: 'sscat_id')  int? sscatId,
    @JsonKey(name: 'Email_id') String? emailId,
    @JsonKey(name: 'SubCat') @Default(null) dynamic subCat,
    @JsonKey(name: 'Gender') String? gender,
    @JsonKey(name: 'Status') int? status,
    @JsonKey(name: 'Flag')  @Default(null) dynamic flag,
    @JsonKey(name: 'Doctor_Mobile_countrycode') String? doctorMobileCountrycode,
    @JsonKey(name: 'Doctor_QualificationCode') @Default(null) dynamic doctorQualificationCode,
    @JsonKey(name: 'Doctor_DOB') String? doctorDob,
    @JsonKey(name: 'Doctor_List') @Default(null) dynamic doctorList,
    @JsonKey(name: 'City_List') @Default(null) dynamic cityList,
    @JsonKey(name: 'Langugage_List') @Default(null) dynamic langList,
    @JsonKey(name: 'Doclist') @Default(null) dynamic docList,
    @JsonKey(name: 'QualificationList') @Default(null) dynamic qualificationList,
    @JsonKey(name: 'CategoryList') @Default(null) dynamic categoryList,



  }) = _GetDoctorDetails;
  static const fromJsonFactory = _$GetDoctorDetailsFromJson;
  factory GetDoctorDetails.fromJson(Map<String, dynamic> json) =>
      _$GetDoctorDetailsFromJson(json);
}


