class HospitalDetailModel {
  int? responseCode;
  String? responseMessage;
  Data? data;

  HospitalDetailModel({this.responseCode, this.responseMessage, this.data});

  HospitalDetailModel.fromJson(Map<String, dynamic> json) {
    responseCode = json['ResponseCode'];
    responseMessage = json['ResponseMessage'];
    data = json['Data'] != null ? new Data.fromJson(json['Data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ResponseCode'] = this.responseCode;
    data['ResponseMessage'] = this.responseMessage;
    if (this.data != null) {
      data['Data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? doctorId;
  int? hospitalId;
  String? hospitalName;
  Null? uRLString;
  int? locationId;
  String? locationName;
  String? cityName;
  Null? hospitalUrlWithName;
  String? hospitalAddress;
  String? hospitalImage;
  Null? service_List;
  Null? password;
  String? aboutHospital;
  String? latitude;
  String? longitude;
  String? timing;
  String? hospitalPhoneNumber;
  String? activeFlag;
  Null? typeFlag;
  String? cDate;
  Null? updateDate;
  int? cityId;
  String? stateName;
  int? stateId;
  int? countryId;
  Null? countryList;
  Null? stateList;
  Null? cityList;
  Null? locationList;
  Null? countryName;
  Null? servicesName;
  Null? serviceList;
  String? hospitalType;
  Null? hospitalMapId;
  Null? hId;
  Null? mobileNumber;
  Null? emailId;
  Null? mapId;
  Null? alreadyRegisterd;
  Null? testTmp;
  Null? mobileCountryCode;
  Null? adminId;

  Data(
      {this.doctorId,
        this.hospitalId,
        this.hospitalName,
        this.uRLString,
        this.locationId,
        this.locationName,
        this.cityName,
        this.hospitalUrlWithName,
        this.hospitalAddress,
        this.hospitalImage,
        this.service_List,
        this.password,
        this.aboutHospital,
        this.latitude,
        this.longitude,
        this.timing,
        this.hospitalPhoneNumber,
        this.activeFlag,
        this.typeFlag,
        this.cDate,
        this.updateDate,
        this.cityId,
        this.stateName,
        this.stateId,
        this.countryId,
        this.countryList,
        this.stateList,
        this.cityList,
        this.locationList,
        this.countryName,
        this.servicesName,
        this.serviceList,
        this.hospitalType,
        this.hospitalMapId,
        this.hId,
        this.mobileNumber,
        this.emailId,
        this.mapId,
        this.alreadyRegisterd,
        this.testTmp,
        this.mobileCountryCode,
        this.adminId});

  Data.fromJson(Map<String, dynamic> json) {
    doctorId = json['Doctor_Id'];
    hospitalId = json['Hospital_id'];
    hospitalName = json['Hospital_Name'];
    uRLString = json['URL_String'];
    locationId = json['Location_id'];
    locationName = json['Location_Name'];
    cityName = json['City_Name'];
    hospitalUrlWithName = json['Hospital_Url_With_Name'];
    hospitalAddress = json['Hospital_Address'];
    hospitalImage = json['Hospital_Image'];
    serviceList = json['Service_list'];
    password = json['Password'];
    aboutHospital = json['AboutHospital'];
    latitude = json['Latitude'];
    longitude = json['Longitude'];
    timing = json['Timing'];
    hospitalPhoneNumber = json['Hospital_PhoneNumber'];
    activeFlag = json['Active_Flag'];
    typeFlag = json['Type_Flag'];
    cDate = json['C_Date'];
    updateDate = json['update_date'];
    cityId = json['City_id'];
    stateName = json['State_Name'];
    stateId = json['State_id'];
    countryId = json['Country_id'];
    countryList = json['Country_List'];
    stateList = json['State_List'];
    cityList = json['City_List'];
    locationList = json['LocationList'];
    countryName = json['Country_Name'];
    servicesName = json['Services_Name'];
    serviceList = json['ServiceList'];
    hospitalType = json['Hospital_Type'];
    hospitalMapId = json['Hospital_Map_Id'];
    hId = json['H_Id'];
    mobileNumber = json['Mobile_Number'];
    emailId = json['Email_Id'];
    mapId = json['Map_Id'];
    alreadyRegisterd = json['Already_Registerd'];
    testTmp = json['Test_Tmp'];
    mobileCountryCode = json['Mobile_country_code'];
    adminId = json['Admin_Id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Doctor_Id'] = this.doctorId;
    data['Hospital_id'] = this.hospitalId;
    data['Hospital_Name'] = this.hospitalName;
    data['URL_String'] = this.uRLString;
    data['Location_id'] = this.locationId;
    data['Location_Name'] = this.locationName;
    data['City_Name'] = this.cityName;
    data['Hospital_Url_With_Name'] = this.hospitalUrlWithName;
    data['Hospital_Address'] = this.hospitalAddress;
    data['Hospital_Image'] = this.hospitalImage;
    data['Service_list'] = this.serviceList;
    data['Password'] = this.password;
    data['AboutHospital'] = this.aboutHospital;
    data['Latitude'] = this.latitude;
    data['Longitude'] = this.longitude;
    data['Timing'] = this.timing;
    data['Hospital_PhoneNumber'] = this.hospitalPhoneNumber;
    data['Active_Flag'] = this.activeFlag;
    data['Type_Flag'] = this.typeFlag;
    data['C_Date'] = this.cDate;
    data['update_date'] = this.updateDate;
    data['City_id'] = this.cityId;
    data['State_Name'] = this.stateName;
    data['State_id'] = this.stateId;
    data['Country_id'] = this.countryId;
    data['Country_List'] = this.countryList;
    data['State_List'] = this.stateList;
    data['City_List'] = this.cityList;
    data['LocationList'] = this.locationList;
    data['Country_Name'] = this.countryName;
    data['Services_Name'] = this.servicesName;
    data['ServiceList'] = this.serviceList;
    data['Hospital_Type'] = this.hospitalType;
    data['Hospital_Map_Id'] = this.hospitalMapId;
    data['H_Id'] = this.hId;
    data['Mobile_Number'] = this.mobileNumber;
    data['Email_Id'] = this.emailId;
    data['Map_Id'] = this.mapId;
    data['Already_Registerd'] = this.alreadyRegisterd;
    data['Test_Tmp'] = this.testTmp;
    data['Mobile_country_code'] = this.mobileCountryCode;
    data['Admin_Id'] = this.adminId;
    return data;
  }
}
