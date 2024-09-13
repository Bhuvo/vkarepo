class CaseSheetModel {
  List<Data>? data;
  String? responseCode;
  String? responseMessage;

  CaseSheetModel({this.data, this.responseCode, this.responseMessage});

  CaseSheetModel.fromJson(Map<String, dynamic> json) {
    if (json['Data'] != null) {
      data = <Data>[];
      json['Data'].forEach((v) {
        data!.add(new Data.fromJson(v));
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

class Data {
  int? caseSheetId;
  String? caseSheetName;
  int? appointmentId;
  int? patientId;
  int? doctorId;
  String? medicalHistory;
  String? allergies;
  String? firstComplaints;
  String? currentTreatment;
  String? previousTreatment;
  String? familyHistory;
  String? review;
  String? smoking;
  String? drinking;
  String? tobacco;
  String? exercise;
  String? diet;
  String? diabetesType;
  String? onsetTime;
  String? diabetesOnsetFrom;
  String? hypoglycemia;
  String? diabeticFoot;
  String? peripheralNeuropathy;
  String? peripheralVascularDisease;
  String? nephropathy;
  String? ckd;
  String? diabeticRetinopathy;
  String? hypertension;
  String? lipidDisorders;
  String? otherAilments;

  Data(
      {this.caseSheetId,
      this.caseSheetName,
      this.appointmentId,
      this.patientId,
      this.doctorId,
      this.medicalHistory,
      this.allergies,
      this.firstComplaints,
      this.currentTreatment,
      this.previousTreatment,
      this.familyHistory,
      this.review,
      this.smoking,
      this.drinking,
      this.tobacco,
      this.exercise,
      this.diet,
      this.diabetesType,
      this.onsetTime,
      this.diabetesOnsetFrom,
      this.hypoglycemia,
      this.diabeticFoot,
      this.peripheralNeuropathy,
      this.peripheralVascularDisease,
      this.nephropathy,
      this.ckd,
      this.diabeticRetinopathy,
      this.hypertension,
      this.lipidDisorders,
      this.otherAilments});

  Data.fromJson(Map<String, dynamic> json) {
    caseSheetId = json['CaseSheet_Id'];
    caseSheetName = json['CaseSheet_Name'];
    appointmentId = json['Appointment_Id'];
    patientId = json['Patient_Id'];
    doctorId = json['Doctor_Id'];
    medicalHistory = json['medical_history'];
    allergies = json['allergies'];
    firstComplaints = json['first_complaints'];
    currentTreatment = json['current_treatment'];
    previousTreatment = json['previous_treatment'];
    familyHistory = json['family_history'];
    review = json['review'];
    smoking = json['smoking'];
    drinking = json['drinking'];
    tobacco = json['tobacco'];
    exercise = json['exercise'];
    diet = json['diet'];
    diabetesType = json['diabetes_type'];
    onsetTime = json['onset_time'];
    diabetesOnsetFrom = json['diabetes_onset_from'];
    hypoglycemia = json['hypoglycemia'];
    diabeticFoot = json['diabetic_foot'];
    peripheralNeuropathy = json['peripheral_neuropathy'];
    peripheralVascularDisease = json['peripheral_vascular_disease'];
    nephropathy = json['nephropathy'];
    ckd = json['ckd'];
    diabeticRetinopathy = json['diabetic_retinopathy'];
    hypertension = json['hypertension'];
    lipidDisorders = json['lipid_disorders'];
    otherAilments = json['other_ailments'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CaseSheet_Id'] = this.caseSheetId;
    data['CaseSheet_Name'] = this.caseSheetName;
    data['Appointment_Id'] = this.appointmentId;
    data['Patient_Id'] = this.patientId;
    data['Doctor_Id'] = this.doctorId;
    data['medical_history'] = this.medicalHistory;
    data['allergies'] = this.allergies;
    data['first_complaints'] = this.firstComplaints;
    data['current_treatment'] = this.currentTreatment;
    data['previous_treatment'] = this.previousTreatment;
    data['family_history'] = this.familyHistory;
    data['review'] = this.review;
    data['smoking'] = this.smoking;
    data['drinking'] = this.drinking;
    data['tobacco'] = this.tobacco;
    data['exercise'] = this.exercise;
    data['diet'] = this.diet;
    data['diabetes_type'] = this.diabetesType;
    data['onset_time'] = this.onsetTime;
    data['diabetes_onset_from'] = this.diabetesOnsetFrom;
    data['hypoglycemia'] = this.hypoglycemia;
    data['diabetic_foot'] = this.diabeticFoot;
    data['peripheral_neuropathy'] = this.peripheralNeuropathy;
    data['peripheral_vascular_disease'] = this.peripheralVascularDisease;
    data['nephropathy'] = this.nephropathy;
    data['ckd'] = this.ckd;
    data['diabetic_retinopathy'] = this.diabeticRetinopathy;
    data['hypertension'] = this.hypertension;
    data['lipid_disorders'] = this.lipidDisorders;
    data['other_ailments'] = this.otherAilments;
    return data;
  }
}
