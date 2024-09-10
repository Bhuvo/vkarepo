// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_hospital_by_doctor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GetAllHospitalByDoctor _$$_GetAllHospitalByDoctorFromJson(
        Map<String, dynamic> json) =>
    _$_GetAllHospitalByDoctor(
      doctorId: json['Doctor_Id'] as int?,
      hospitalId: json['Hospital_id'] as int?,
      hospitalName: json['Hospital_Name'] as String?,
      urlString: json['URL_String'] ?? null,
      locationId: json['Location_id'] as int?,
      locationName: json['Location_Name'] as String?,
      cityName: json['City_Name'] as String?,
      hospitalUrlWithName: json['Hospital_Url_With_Name'] ?? null,
      hospitalAddress: json['Hospital_Address'] as String?,
      hospitalImage: json['Hospital_Image'] as String?,
      labTestDepartmentListServiceList: json['Service_list'] ?? null,
      password: json['Password'] ?? null,
      aboutHospital: json['AboutHospital'] as String?,
      latitude: json['Latitude'] as String?,
      longitude: json['Longitude'] as String?,
      timing: json['Timing'] as String?,
      hospitalPhoneNumber: json['Hospital_PhoneNumber'] as String?,
      activeFlag: json['Active_Flag'] as String?,
      typeFlag: json['Type_Flag'] ?? null,
      cDate: json['C_Date'] as String?,
      updateDate: json['update_date'] ?? null,
      cityId: json['City_id'] as int?,
      stateName: json['State_Name'] ?? null,
      stateId: json['State_id'] as int?,
      countryId: json['Country_id'] as int?,
      countryList: json['Country_List'] ?? null,
      stateList: json['State_List'] ?? null,
      cityList: json['City_List'] ?? null,
      locationList: json['LocationList'] ?? null,
      countryName: json['Country_Name'] ?? null,
      servicesName: json['Services_Name'] ?? null,
      serviceList: json['ServiceList'] ?? null,
      hospitalType: json['Hospital_Type'] as String?,
      hospitalMapId: json['Hospital_Map_Id'] ?? null,
      hId: json['H_Id'] ?? null,
      mobileNumber: json['Mobile_Number'] ?? null,
      emailId: json['Email_Id'] ?? null,
      mapId: json['Map_Id'] ?? null,
      alreadyRegisterd: json['Already_Registerd'] ?? null,
      testTmp: json['Test_Tmp'] ?? null,
      mobileCountryCode: json['Mobile_country_code'] ?? null,
    );

Map<String, dynamic> _$$_GetAllHospitalByDoctorToJson(
        _$_GetAllHospitalByDoctor instance) =>
    <String, dynamic>{
      'Doctor_Id': instance.doctorId,
      'Hospital_id': instance.hospitalId,
      'Hospital_Name': instance.hospitalName,
      'URL_String': instance.urlString,
      'Location_id': instance.locationId,
      'Location_Name': instance.locationName,
      'City_Name': instance.cityName,
      'Hospital_Url_With_Name': instance.hospitalUrlWithName,
      'Hospital_Address': instance.hospitalAddress,
      'Hospital_Image': instance.hospitalImage,
      'Service_list': instance.labTestDepartmentListServiceList,
      'Password': instance.password,
      'AboutHospital': instance.aboutHospital,
      'Latitude': instance.latitude,
      'Longitude': instance.longitude,
      'Timing': instance.timing,
      'Hospital_PhoneNumber': instance.hospitalPhoneNumber,
      'Active_Flag': instance.activeFlag,
      'Type_Flag': instance.typeFlag,
      'C_Date': instance.cDate,
      'update_date': instance.updateDate,
      'City_id': instance.cityId,
      'State_Name': instance.stateName,
      'State_id': instance.stateId,
      'Country_id': instance.countryId,
      'Country_List': instance.countryList,
      'State_List': instance.stateList,
      'City_List': instance.cityList,
      'LocationList': instance.locationList,
      'Country_Name': instance.countryName,
      'Services_Name': instance.servicesName,
      'ServiceList': instance.serviceList,
      'Hospital_Type': instance.hospitalType,
      'Hospital_Map_Id': instance.hospitalMapId,
      'H_Id': instance.hId,
      'Mobile_Number': instance.mobileNumber,
      'Email_Id': instance.emailId,
      'Map_Id': instance.mapId,
      'Already_Registerd': instance.alreadyRegisterd,
      'Test_Tmp': instance.testTmp,
      'Mobile_country_code': instance.mobileCountryCode,
    };
