class PrescriptionTemplateModel {
  dynamic registrations;
  dynamic hospitalPhoneNumber;
  String? hospitalName;
  int? printTemplateId;
  String? accreditationImage1;
  String? accreditationImage2;
  String? hospitalLogo;
  String? hospitalAddress;
  String? awardImage;
  String? hospitalWorkingHours;
  String? hospitalEmailid;
  String? activeFlag;
  String? displayFlag;
  String? doctorName;
  String? doctorPhoneNumber;

  PrescriptionTemplateModel(
      {this.registrations,
        this.hospitalPhoneNumber,
        this.hospitalName,
        this.printTemplateId,
        this.accreditationImage1,
        this.accreditationImage2,
        this.hospitalLogo,
        this.hospitalAddress,
        this.awardImage,
        this.hospitalWorkingHours,
        this.hospitalEmailid,
        this.activeFlag,
        this.displayFlag,
        this.doctorName,
        this.doctorPhoneNumber});

  PrescriptionTemplateModel.fromJson(Map<String, dynamic> json) {
    registrations = json['Registrations'];
    hospitalPhoneNumber = json['Hospital_PhoneNumber'];
    hospitalName = json['Hospital_Name'];
    printTemplateId = json['PrintTemplate_id'];
    accreditationImage1 = json['AccreditationImage1'];
    accreditationImage2 = json['AccreditationImage2'];
    hospitalLogo = json['HospitalLogo'];
    hospitalAddress = json['HospitalAddress'];
    awardImage = json['AwardImage'];
    hospitalWorkingHours = json['HospitalWorkingHours'];
    hospitalEmailid = json['HospitalEmailid'];
    activeFlag = json['Active_Flag'];
    displayFlag = json['DisplayFlag'];
    doctorName = json['Doctor_Name'];
    doctorPhoneNumber = json['Doctor_Phone_Number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Registrations'] = this.registrations;
    data['Hospital_PhoneNumber'] = this.hospitalPhoneNumber;
    data['Hospital_Name'] = this.hospitalName;
    data['PrintTemplate_id'] = this.printTemplateId;
    data['AccreditationImage1'] = this.accreditationImage1;
    data['AccreditationImage2'] = this.accreditationImage2;
    data['HospitalLogo'] = this.hospitalLogo;
    data['HospitalAddress'] = this.hospitalAddress;
    data['AwardImage'] = this.awardImage;
    data['HospitalWorkingHours'] = this.hospitalWorkingHours;
    data['HospitalEmailid'] = this.hospitalEmailid;
    data['Active_Flag'] = this.activeFlag;
    data['DisplayFlag'] = this.displayFlag;
    data['Doctor_Name'] = this.doctorName;
    data['Doctor_Phone_Number'] = this.doctorPhoneNumber;
    return data;
  }
}
