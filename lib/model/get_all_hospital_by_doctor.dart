import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_all_hospital_by_doctor.freezed.dart';
part 'get_all_hospital_by_doctor.g.dart';

@freezed
class GetAllHospitalByDoctor with _$GetAllHospitalByDoctor {
  const factory GetAllHospitalByDoctor({

            @JsonKey(name: 'Doctor_Id') int? doctorId,
            @JsonKey(name: 'Hospital_id') int? hospitalId,
            @JsonKey(name: 'Hospital_Name') String? hospitalName,
            @JsonKey(name: 'URL_String') @Default(null) dynamic urlString,
            @JsonKey(name: 'Location_id') int? locationId,
            @JsonKey(name: 'Location_Name') String? locationName,
            @JsonKey(name: 'City_Name') String? cityName,
            @JsonKey(name: 'Hospital_Url_With_Name') @Default(null) dynamic hospitalUrlWithName,
            @JsonKey(name: 'Hospital_Address') String? hospitalAddress,
            @JsonKey(name: 'Hospital_Image') String? hospitalImage,
            @JsonKey(name: 'Service_list') @Default(null) dynamic labTestDepartmentListServiceList,
            @JsonKey(name: 'Password') @Default(null) dynamic password,
            @JsonKey(name: 'AboutHospital') String? aboutHospital,
            @JsonKey(name: 'Latitude') String? latitude,
            @JsonKey(name: 'Longitude') String? longitude,
            @JsonKey(name: 'Timing') String? timing,
            @JsonKey(name: 'Hospital_PhoneNumber') String? hospitalPhoneNumber,
            @JsonKey(name: 'Active_Flag') String? activeFlag,
            @JsonKey(name: 'Type_Flag') @Default(null) dynamic typeFlag,
            @JsonKey(name: 'C_Date') String? cDate,
            @JsonKey(name: 'update_date') @Default(null) dynamic updateDate,
            @JsonKey(name: 'City_id') int? cityId,
            @JsonKey(name: 'State_Name')  @Default(null) dynamic stateName,
            @JsonKey(name: 'State_id') int? stateId,
            @JsonKey(name: 'Country_id') int? countryId,
            @JsonKey(name: 'Country_List') @Default(null) dynamic countryList,
            @JsonKey(name: 'State_List') @Default(null) dynamic stateList,
            @JsonKey(name: 'City_List') @Default(null) dynamic cityList,
            @JsonKey(name: 'LocationList') @Default(null) dynamic locationList,
            @JsonKey(name: 'Country_Name') @Default(null) dynamic countryName,
            @JsonKey(name: 'Services_Name') @Default(null) dynamic servicesName,
            @JsonKey(name: 'ServiceList') @Default(null) dynamic serviceList,
            @JsonKey(name: 'Hospital_Type') String? hospitalType,
            @JsonKey(name: 'Hospital_Map_Id') @Default(null) dynamic hospitalMapId,
            @JsonKey(name: 'H_Id') @Default(null) dynamic hId,
            @JsonKey(name: 'Mobile_Number') @Default(null) dynamic mobileNumber,
            @JsonKey(name: 'Email_Id') @Default(null) dynamic emailId,
            @JsonKey(name: 'Map_Id') @Default(null) dynamic mapId,
            @JsonKey(name: 'Already_Registerd') @Default(null) dynamic alreadyRegisterd,
            @JsonKey(name: 'Test_Tmp') @Default(null) dynamic testTmp,
            @JsonKey(name: 'Mobile_country_code') @Default(null) dynamic mobileCountryCode,

  }) = _GetAllHospitalByDoctor;
  static const fromJsonFactory = _$GetAllHospitalByDoctorFromJson;
  factory GetAllHospitalByDoctor.fromJson(Map<String, dynamic> json) =>
      _$GetAllHospitalByDoctorFromJson(json);
}


