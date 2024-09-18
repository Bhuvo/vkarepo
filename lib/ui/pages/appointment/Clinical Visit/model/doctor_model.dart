class DoctorModel {
  List<DoctorData>? data;
  String? responseCode;
  String? responseMessage;

  DoctorModel({this.data, this.responseCode, this.responseMessage});

  DoctorModel.fromJson(Map<String, dynamic> json) {
    if (json['Data'] != null) {
      data = <DoctorData>[];
      json['Data'].forEach((v) {
        data!.add(new DoctorData.fromJson(v));
      });
    }
    responseCode = json['ResponseCode'];
    responseMessage = json['ResponseMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['Data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['ResponseCode'] = this.responseCode;
    data['ResponseMessage'] = this.responseMessage;
    return data;
  }
}

class DoctorData {
  int? doctorId;
  String? specialization;
  String? doctorName;
  String? doctorNameTemp;
  String? doctorQualification;
  int? doctorExperienceYears;
  int? recommendations;
  String? doctorDescription;
  String? doctorImage;
  String? doctorAddress;
  String? typeFlag;
  int? feedBack;
  int? clinicDoctorFee;
  String? clinicName;
  String? clinicNameTemp;
  int? clinicId;
  String? fromTime;
  String? toTime;
  int? locationId;
  String? locationName;
  String? locationNameTemp;
  String? days;
  List<Dayslot>? dayslot;

  DoctorData(
      {this.doctorId,
        this.specialization,
        this.doctorName,
        this.doctorNameTemp,
        this.doctorQualification,
        this.doctorExperienceYears,
        this.recommendations,
        this.doctorDescription,
        this.doctorImage,
        this.doctorAddress,
        this.typeFlag,
        this.feedBack,
        this.clinicDoctorFee,
        this.clinicName,
        this.clinicNameTemp,
        this.clinicId,
        this.fromTime,
        this.toTime,
        this.locationId,
        this.locationName,
        this.locationNameTemp,
        this.days,
        this.dayslot});

  DoctorData.fromJson(Map<String, dynamic> json) {
    doctorId = json['Doctor_id'];
    specialization = json['Specialization'];
    doctorName = json['Doctor_Name'];
    doctorNameTemp = json['Doctor_Name_temp'];
    doctorQualification = json['Doctor_Qualification'];
    doctorExperienceYears = json['DoctorExperience_Years'];
    recommendations = json['Recommendations'];
    doctorDescription = json['Doctor_Description'];
    doctorImage = json['Doctor_Image'];
    doctorAddress = json['Doctor_Address'];
    typeFlag = json['Type_Flag'];
    feedBack = json['FeedBack'];
    clinicDoctorFee = json['ClinicDoctorFee'];
    clinicName = json['Clinic_Name'];
    clinicNameTemp = json['Clinic_Name_temp'];
    clinicId = json['Clinic_id'];
    fromTime = json['FromTime'];
    toTime = json['ToTime'];
    locationId = json['Location_id'];
    locationName = json['Location_Name'];
    locationNameTemp = json['Location_Name_Temp'];
    days = json['Days'];
    if (json['Dayslot'] != null) {
      dayslot = <Dayslot>[];
      json['Dayslot'].forEach((v) {
        dayslot!.add(new Dayslot.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Doctor_id'] = this.doctorId;
    data['Specialization'] = this.specialization;
    data['Doctor_Name'] = this.doctorName;
    data['Doctor_Name_temp'] = this.doctorNameTemp;
    data['Doctor_Qualification'] = this.doctorQualification;
    data['DoctorExperience_Years'] = this.doctorExperienceYears;
    data['Recommendations'] = this.recommendations;
    data['Doctor_Description'] = this.doctorDescription;
    data['Doctor_Image'] = this.doctorImage;
    data['Doctor_Address'] = this.doctorAddress;
    data['Type_Flag'] = this.typeFlag;
    data['FeedBack'] = this.feedBack;
    data['ClinicDoctorFee'] = this.clinicDoctorFee;
    data['Clinic_Name'] = this.clinicName;
    data['Clinic_Name_temp'] = this.clinicNameTemp;
    data['Clinic_id'] = this.clinicId;
    data['FromTime'] = this.fromTime;
    data['ToTime'] = this.toTime;
    data['Location_id'] = this.locationId;
    data['Location_Name'] = this.locationName;
    data['Location_Name_Temp'] = this.locationNameTemp;
    data['Days'] = this.days;
    if (this.dayslot != null) {
      data['Dayslot'] = this.dayslot!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Dayslot {
  String? time;
  String? fromTime;
  String? toTime;
  List<String>? day;
  Null? daysName;
  Null? timeList;

  Dayslot(
      {this.time,
        this.fromTime,
        this.toTime,
        this.day,
        this.daysName,
        this.timeList});

  Dayslot.fromJson(Map<String, dynamic> json) {
    time = json['Time'];
    fromTime = json['FromTime'];
    toTime = json['ToTime'];
    day = json['Day'].cast<String>();
    daysName = json['Days_Name'];
    timeList = json['Time_List'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Time'] = this.time;
    data['FromTime'] = this.fromTime;
    data['ToTime'] = this.toTime;
    data['Day'] = this.day;
    data['Days_Name'] = this.daysName;
    data['Time_List'] = this.timeList;
    return data;
  }
}
