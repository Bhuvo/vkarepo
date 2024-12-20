import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    @JsonKey(name: 'Doctor_id') @Default(null) dynamic id,
    @JsonKey(name: 'User_id') @Default(null) dynamic userId,
    @JsonKey(name: 'BookCheck') String? bookCheck,
    @JsonKey(name: 'Gender') dynamic gender,
    @JsonKey(name: 'Registrations') String? registration,
    @JsonKey(name: 'PClaim_id') num? pClainId,
    @JsonKey(name: 'PDoctor_Name') num? pDoctorName,
    @JsonKey(name: 'PHospital_Name') num? pHospitalName,
    @JsonKey(name: 'PDoctor_Image') num? pDoctorImage,
    @JsonKey(name: 'PAppointment_Schedule') num? pAppointmentSchedule,
    @JsonKey(name: 'PConsultation_Fee') num? pConsulationFee,
    @JsonKey(name: 'PFlag') String? pFlag,
    @JsonKey(name: 'FeedBack') num? feedback,
    @JsonKey(name: 'SubList') String? subList,
    @JsonKey(name: 'eclinic_Flag') String? eClinicFlag,
    @JsonKey(name: 'CityListDisplay') String? cityListDisplay,
    @JsonKey(name: 'City_NameTmp') String? cityNameTmp,
    @JsonKey(name: 'City_Name') String? cityName,
    @JsonKey(name: 'City_id') num? cityId,
    @JsonKey(name: 'Location_Name_Temp') String? locationNameTemp,
    @JsonKey(name: 'URL_String') String? urlString,
    @JsonKey(name: 'Specialization') String? specialization,
    @JsonKey(name: 'Doctor_Name') String? fullName,
    @JsonKey(name: 'Name') String? name,
    @JsonKey(name: 'Doctor_Name_temp') String? nameTemp,
    @JsonKey(name: 'Doctor_Qualification') String? doctorQualification,
    @JsonKey(name: 'Qualification') String? qualification,
    @JsonKey(name: 'Location_id') num? locationId,
    @JsonKey(name: 'Location_name') String? locationName,
    @JsonKey(name: 'SubCategory_id') num? subCategoryId,
    @JsonKey(name: 'sscat_id') num? sscatId,
    @JsonKey(name: 'sscategory_Name') String? sscategoryName,
    @JsonKey(name: 'DoctorExperience_Years') num? experience,
    @JsonKey(name: 'Recommendations')@Default(null) dynamic recommendations,
    @JsonKey(name: 'Doctor_Description') String? description,
    @JsonKey(name: 'Doctor_Image') String? image,
    @JsonKey(name: 'Doctor_Age') int? age,
    @JsonKey(name: 'Doctor_PhoneNumber') String? phone,
    @JsonKey(name: 'SubCategory_Name') String? subCategoryName,
    @JsonKey(name: 'SubCategory_Name_temp') String? subCategoryNameTemp,
    @JsonKey(name: 'Doctor_Address') String? address,
    @JsonKey(name: 'type') String? type,
    @JsonKey(name: 'ClinicDoctorFee') num? clinicDoctorFee,
    @JsonKey(name: 'Type_Flag') String? typeFlag,
    @JsonKey(name: 'Days') String? days,
    @JsonKey(name: 'Dayslot') String? daysTotal,
    @JsonKey(name: 'Clinic_Images') String? clinicImages,
    @JsonKey(name: 'CImage') String? cImage,
    @JsonKey(name: 'FromTime') String? fromTime,
    @JsonKey(name: 'ToTime') String? toTime,
    @JsonKey(name: 'Doctor_Email') String? email,
    @JsonKey(name: 'EMail_Id') String? emailId,
    @JsonKey(name: 'Password') String? password,
    @JsonKey(name: 'Hospital_List') String? hospitalList,
    @JsonKey(name: 'subcatlist') String? subCatList,
    @JsonKey(name: 'LocationNewList') String? locationNewList,
    @JsonKey(name: 'Between_Distance') num? betweenDistance,
    @JsonKey(name: 'service_id') num? serviceId,
    @JsonKey(name: 'service_name') String? serviceName,
    @JsonKey(name: 'endorse_list') String? endorseList,
    @JsonKey(name: 'cancel_flag') String? cancelFlag,
    @JsonKey(name: 'clinicid') num? clinicId,
    @JsonKey(name: 'clinicname') String? clinicName,
    @JsonKey(name: 'clinicfee') num? clinicFee,
    @JsonKey(name: 'Latitude') String? latitude,
    @JsonKey(name: 'Longitude') String? longitude,
    @JsonKey(name: 'Hospital_Name') String? hospitalName,
    @JsonKey(name: 'Hospital_Number') String? hospitalNumber,
    @JsonKey(name: 'Country_Id') num? countryId,
    @JsonKey(name: 'Clinic_Model') String? clinicModel,
    @JsonKey(name: 'Doctor_Url_With_Name') String? doctorUrlWithName,
    @JsonKey(name: 'Doctor_URL_City') String? doctorUrlCity,
    @JsonKey(name: 'Doctor_Designation') String? designation,
    @JsonKey(name: 'Phone_Number') String? phoneNumber,
    @JsonKey(name: 'Language_Name') String? languageName,
    @JsonKey(name: 'Watsapp_Number') String? whatsapp,
    @JsonKey(name: 'Patient_Id') @Default(null) dynamic patientid,
    @JsonKey(name: 'Patient_Registration_Number')
    @Default(null)
    dynamic patientregistrationnumber,
    @JsonKey(name: 'First_Name') @Default(null) dynamic firstname,
    @JsonKey(name: 'Last_Name') @Default(null) dynamic lastname,
    @JsonKey(name: 'DOB') @Default(null) dynamic dob,
    @JsonKey(name: 'Age') @Default(null) dynamic patientage,
    @JsonKey(name: 'Image') @Default(null) dynamic patientImage,
    @JsonKey(name: 'Time_in_Therapeutic_Ratio') @Default(null) dynamic TTR,
    @JsonKey(name: 'Traget_INR_From') @Default(null) dynamic TTRfrom,
    @JsonKey(name: 'Traget_INR_To') @Default(null) dynamic TTRto,
    @JsonKey(name: 'Date') @Default(null) dynamic date,
    @JsonKey(name: 'Doctor_ActiveFlag')
    @Default(null)
    dynamic doctorActivationflag,
    @JsonKey(name: 'Patient_ActiveFlag')
    @Default(null)
    dynamic patientActivationflag,
    @JsonKey(name: 'PatientRegistration_list')
    @Default(null)
    dynamic patientRegistrationlist,
    @JsonKey(name : 'Nurse_Id') @Default(null) dynamic nurseId,
    @JsonKey(name : 'Nurse_Name') @Default(null) dynamic nurseName,
    @JsonKey(name : 'FoMem_Id') @Default(null) dynamic foId,
    @JsonKey(name : 'FoMem_Name') @Default(null) dynamic foName,
    @JsonKey(name: 'Hospital_Admin_Id') @Default(null) dynamic hospitalAdminId,
    @JsonKey(name: 'Hospital_Id') @Default(null) dynamic hospitalId,
    @JsonKey(name: 'Email_Id') @Default(null) dynamic hospitalEmailId,
    @JsonKey(name: 'AdminGender') @Default(null) dynamic adminGender,
    @JsonKey(name: 'Address') @Default(null) dynamic adminAddress,
    @JsonKey(name: 'User_Firstname') @Default(null) dynamic adminName,
    @JsonKey(name: 'Mobile_Number') @Default(null) dynamic adminNumber,

  }) = _User;
  static const fromJsonFactory = _$UserFromJson;
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
