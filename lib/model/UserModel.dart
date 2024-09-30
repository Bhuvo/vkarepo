class UserModel {
  Data? data;
  String? responseCode;
  String? responseMessage;

  UserModel({this.data, this.responseCode, this.responseMessage});

  UserModel.fromJson(Map<String, dynamic> json) {
    data = json['Data'] != null ? new Data.fromJson(json['Data']) : null;
    responseCode = json['ResponseCode'];
    responseMessage = json['ResponseMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['Data'] = this.data!.toJson();
    }
    data['ResponseCode'] = this.responseCode;
    data['ResponseMessage'] = this.responseMessage;
    return data;
  }
}

class Data {
  dynamic bookCheck;
  dynamic gender;
  dynamic registrations;
  int? pClaimId;
  int? pDoctorName;
  int? pHospitalName;
  int? pDoctorImage;
  int? pAppointmentSchedule;
  int? pConsultationFee;
  dynamic pFlag;
  int? feedBack;
  dynamic subList;
  dynamic eclinicFlag;
  dynamic cityListDisplay;
  dynamic cityNameTmp;
  dynamic cityName;
  int? cityId;
  dynamic locationNameTemp;
  dynamic uRLString;
  int? doctorId;
  dynamic specialization;
  String? doctorName;
  dynamic doctorNameTemp;
  dynamic doctorQualification;
  int? locationId;
  dynamic locationName;
  int? subCategoryId;
  int? sscatId;
  dynamic sscategoryName;
  int? doctorExperienceYears;
  dynamic recommendations;
  dynamic doctorDescription;
  String? doctorImage;
  int? doctorAge;
  dynamic doctorPhoneNumber;
  dynamic subCategoryName;
  dynamic subCategoryNameTemp;
  dynamic doctorAddress;
  dynamic type;
  int? clinicDoctorFee;
  dynamic typeFlag;
  dynamic days;
  dynamic dayslot;
  dynamic clinicImages;
  dynamic cImage;
  dynamic fromTime;
  dynamic toTime;
  dynamic doctorEmail;
  dynamic hospitalList;
  dynamic subcatlist;
  dynamic locationNewList;
  int? betweenDistance;
  int? serviceId;
  dynamic serviceName;
  dynamic endorseList;
  dynamic cancelFlag;
  int? clinicid;
  dynamic clinicname;
  int? clinicfee;
  dynamic latitude;
  dynamic longitude;
  dynamic hospitalName;
  dynamic countryId;
  dynamic clinicModel;
  dynamic doctorUrlWithName;
  dynamic doctorURLCity;
  dynamic doctorDesignation;
  dynamic languageName;
  int? fee;
  int? nurseId;
  dynamic nurseName;
  int? foMemId;
  dynamic foMemName;

  Data(
      {this.bookCheck,
        this.gender,
        this.registrations,
        this.pClaimId,
        this.pDoctorName,
        this.pHospitalName,
        this.pDoctorImage,
        this.pAppointmentSchedule,
        this.pConsultationFee,
        this.pFlag,
        this.feedBack,
        this.subList,
        this.eclinicFlag,
        this.cityListDisplay,
        this.cityNameTmp,
        this.cityName,
        this.cityId,
        this.locationNameTemp,
        this.uRLString,
        this.doctorId,
        this.specialization,
        this.doctorName,
        this.doctorNameTemp,
        this.doctorQualification,
        this.locationId,
        this.locationName,
        this.subCategoryId,
        this.sscatId,
        this.sscategoryName,
        this.doctorExperienceYears,
        this.recommendations,
        this.doctorDescription,
        this.doctorImage,
        this.doctorAge,
        this.doctorPhoneNumber,
        this.subCategoryName,
        this.subCategoryNameTemp,
        this.doctorAddress,
        this.type,
        this.clinicDoctorFee,
        this.typeFlag,
        this.days,
        this.dayslot,
        this.clinicImages,
        this.cImage,
        this.fromTime,
        this.toTime,
        this.doctorEmail,
        this.hospitalList,
        this.subcatlist,
        this.locationNewList,
        this.betweenDistance,
        this.serviceId,
        this.serviceName,
        this.endorseList,
        this.cancelFlag,
        this.clinicid,
        this.clinicname,
        this.clinicfee,
        this.latitude,
        this.longitude,
        this.hospitalName,
        this.countryId,
        this.clinicModel,
        this.doctorUrlWithName,
        this.doctorURLCity,
        this.doctorDesignation,
        this.languageName,
        this.fee,
        this.nurseId,
        this.nurseName,
        this.foMemId,
        this.foMemName});

  Data.fromJson(Map<String, dynamic> json) {
    bookCheck = json['BookCheck'];
    gender = json['Gender'];
    registrations = json['Registrations'];
    pClaimId = json['PClaim_id'];
    pDoctorName = json['PDoctor_Name'];
    pHospitalName = json['PHospital_Name'];
    pDoctorImage = json['PDoctor_Image'];
    pAppointmentSchedule = json['PAppointment_Schedule'];
    pConsultationFee = json['PConsultation_Fee'];
    pFlag = json['PFlag'];
    feedBack = json['FeedBack'];
    subList = json['SubList'];
    eclinicFlag = json['eclinic_Flag'];
    cityListDisplay = json['CityListDisplay'];
    cityNameTmp = json['City_NameTmp'];
    cityName = json['City_Name'];
    cityId = json['City_id'];
    locationNameTemp = json['Location_Name_Temp'];
    uRLString = json['URL_String'];
    doctorId = json['Doctor_id'];
    specialization = json['Specialization'];
    doctorName = json['Doctor_Name'];
    doctorNameTemp = json['Doctor_Name_temp'];
    doctorQualification = json['Doctor_Qualification'];
    locationId = json['Location_id'];
    locationName = json['Location_name'];
    subCategoryId = json['SubCategory_id'];
    sscatId = json['sscat_id'];
    sscategoryName = json['sscategory_Name'];
    doctorExperienceYears = json['DoctorExperience_Years'];
    recommendations = json['Recommendations'];
    doctorDescription = json['Doctor_Description'];
    doctorImage = json['Doctor_Image'];
    doctorAge = json['Doctor_Age'];
    doctorPhoneNumber = json['Doctor_PhoneNumber'];
    subCategoryName = json['SubCategory_Name'];
    subCategoryNameTemp = json['SubCategory_Name_temp'];
    doctorAddress = json['Doctor_Address'];
    type = json['type'];
    clinicDoctorFee = json['ClinicDoctorFee'];
    typeFlag = json['Type_Flag'];
    days = json['Days'];
    dayslot = json['Dayslot'];
    clinicImages = json['Clinic_Images'];
    cImage = json['CImage'];
    fromTime = json['FromTime'];
    toTime = json['ToTime'];
    doctorEmail = json['Doctor_Email'];
    hospitalList = json['Hospital_List'];
    subcatlist = json['subcatlist'];
    locationNewList = json['LocationNewList'];
    betweenDistance = json['Between_Distance'];
    serviceId = json['service_id'];
    serviceName = json['service_name'];
    endorseList = json['endorse_list'];
    cancelFlag = json['cancel_flag'];
    clinicid = json['clinicid'];
    clinicname = json['clinicname'];
    clinicfee = json['clinicfee'];
    latitude = json['Latitude'];
    longitude = json['Longitude'];
    hospitalName = json['Hospital_Name'];
    countryId = json['Country_Id'];
    clinicModel = json['Clinic_Model'];
    doctorUrlWithName = json['Doctor_Url_With_Name'];
    doctorURLCity = json['Doctor_URL_City'];
    doctorDesignation = json['Doctor_Designation'];
    languageName = json['Language_Name'];
    fee = json['Fee'];
    nurseId = json['Nurse_Id'];
    nurseName = json['Nurse_Name'];
    foMemId = json['FoMem_Id'];
    foMemName = json['FoMem_Name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['BookCheck'] = this.bookCheck;
    data['Gender'] = this.gender;
    data['Registrations'] = this.registrations;
    data['PClaim_id'] = this.pClaimId;
    data['PDoctor_Name'] = this.pDoctorName;
    data['PHospital_Name'] = this.pHospitalName;
    data['PDoctor_Image'] = this.pDoctorImage;
    data['PAppointment_Schedule'] = this.pAppointmentSchedule;
    data['PConsultation_Fee'] = this.pConsultationFee;
    data['PFlag'] = this.pFlag;
    data['FeedBack'] = this.feedBack;
    data['SubList'] = this.subList;
    data['eclinic_Flag'] = this.eclinicFlag;
    data['CityListDisplay'] = this.cityListDisplay;
    data['City_NameTmp'] = this.cityNameTmp;
    data['City_Name'] = this.cityName;
    data['City_id'] = this.cityId;
    data['Location_Name_Temp'] = this.locationNameTemp;
    data['URL_String'] = this.uRLString;
    data['Doctor_id'] = this.doctorId;
    data['Specialization'] = this.specialization;
    data['Doctor_Name'] = this.doctorName;
    data['Doctor_Name_temp'] = this.doctorNameTemp;
    data['Doctor_Qualification'] = this.doctorQualification;
    data['Location_id'] = this.locationId;
    data['Location_name'] = this.locationName;
    data['SubCategory_id'] = this.subCategoryId;
    data['sscat_id'] = this.sscatId;
    data['sscategory_Name'] = this.sscategoryName;
    data['DoctorExperience_Years'] = this.doctorExperienceYears;
    data['Recommendations'] = this.recommendations;
    data['Doctor_Description'] = this.doctorDescription;
    data['Doctor_Image'] = this.doctorImage;
    data['Doctor_Age'] = this.doctorAge;
    data['Doctor_PhoneNumber'] = this.doctorPhoneNumber;
    data['SubCategory_Name'] = this.subCategoryName;
    data['SubCategory_Name_temp'] = this.subCategoryNameTemp;
    data['Doctor_Address'] = this.doctorAddress;
    data['type'] = this.type;
    data['ClinicDoctorFee'] = this.clinicDoctorFee;
    data['Type_Flag'] = this.typeFlag;
    data['Days'] = this.days;
    data['Dayslot'] = this.dayslot;
    data['Clinic_Images'] = this.clinicImages;
    data['CImage'] = this.cImage;
    data['FromTime'] = this.fromTime;
    data['ToTime'] = this.toTime;
    data['Doctor_Email'] = this.doctorEmail;
    data['Hospital_List'] = this.hospitalList;
    data['subcatlist'] = this.subcatlist;
    data['LocationNewList'] = this.locationNewList;
    data['Between_Distance'] = this.betweenDistance;
    data['service_id'] = this.serviceId;
    data['service_name'] = this.serviceName;
    data['endorse_list'] = this.endorseList;
    data['cancel_flag'] = this.cancelFlag;
    data['clinicid'] = this.clinicid;
    data['clinicname'] = this.clinicname;
    data['clinicfee'] = this.clinicfee;
    data['Latitude'] = this.latitude;
    data['Longitude'] = this.longitude;
    data['Hospital_Name'] = this.hospitalName;
    data['Country_Id'] = this.countryId;
    data['Clinic_Model'] = this.clinicModel;
    data['Doctor_Url_With_Name'] = this.doctorUrlWithName;
    data['Doctor_URL_City'] = this.doctorURLCity;
    data['Doctor_Designation'] = this.doctorDesignation;
    data['Language_Name'] = this.languageName;
    data['Fee'] = this.fee;
    data['Nurse_Id'] = this.nurseId;
    data['Nurse_Name'] = this.nurseName;
    data['FoMem_Id'] = this.foMemId;
    data['FoMem_Name'] = this.foMemName;
    return data;
  }
}
