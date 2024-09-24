// To parse this JSON data, do
//
//     final vitalSignsChartModel = vitalSignsChartModelFromJson(jsonString);

import 'dart:convert';

VitalSignsChartModel vitalSignsChartModelFromJson(String str) =>
    VitalSignsChartModel.fromJson(json.decode(str));

String vitalSignsChartModelToJson(VitalSignsChartModel data) =>
    json.encode(data.toJson());

class VitalSignsChartModel {
  int? responseCode;
  String? responseMessage;
  Data? data;

  VitalSignsChartModel({this.responseCode, this.responseMessage, this.data});

  VitalSignsChartModel.fromJson(Map<String, dynamic> json) {
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
  int? summaryId;
  dynamic? pulse;
  dynamic? diseaseName;
  dynamic? allergies;
  dynamic? symptoms;
  dynamic? height;
  dynamic? weight;
  dynamic? temp;
  dynamic? diagnoses;
  dynamic? causes;
  dynamic? investigation;
  dynamic? notes;
  int? doctorId;
  int? appointmentId;
  int? userId;
  dynamic? statusFlag;
  dynamic? insertDate;
  dynamic? dietAndExercise;
  dynamic? bPSystolic;
  dynamic? bPDiastolic;
  dynamic? waist;
  dynamic? hip;
  dynamic? sPO2;
  dynamic? bMI;
  int? nurseId;
  int? doctorFlag;
  int? nurseFlag;
  int? patientFlag;
  List<ClincialList>? clincialList;

  Data(
      {this.summaryId,
        this.pulse,
        this.diseaseName,
        this.allergies,
        this.symptoms,
        this.height,
        this.weight,
        this.temp,
        this.diagnoses,
        this.causes,
        this.investigation,
        this.notes,
        this.doctorId,
        this.appointmentId,
        this.userId,
        this.statusFlag,
        this.insertDate,
        this.dietAndExercise,
        this.bPSystolic,
        this.bPDiastolic,
        this.waist,
        this.hip,
        this.sPO2,
        this.bMI,
        this.nurseId,
        this.doctorFlag,
        this.nurseFlag,
        this.patientFlag,
        this.clincialList});

  Data.fromJson(Map<String, dynamic> json) {
    summaryId = json['Summary_id'];
    pulse = json['Pulse'];
    diseaseName = json['Disease_name'];
    allergies = json['Allergies'];
    symptoms = json['Symptoms'];
    height = json['Height'];
    weight = json['Weight'];
    temp = json['Temp'];
    diagnoses = json['Diagnoses'];
    causes = json['Causes'];
    investigation = json['Investigation'];
    notes = json['Notes'];
    doctorId = json['Doctor_id'];
    appointmentId = json['Appointment_id'];
    userId = json['User_id'];
    statusFlag = json['Status_Flag'];
    insertDate = json['Insert_Date'];
    dietAndExercise = json['Diet_And_Exercise'];
    bPSystolic = json['BP_Systolic'];
    bPDiastolic = json['BP_Diastolic'];
    waist = json['Waist'];
    hip = json['Hip'];
    sPO2 = json['SPO2'];
    bMI = json['BMI'];
    nurseId = json['Nurse_Id'];
    doctorFlag = json['Doctor_Flag'];
    nurseFlag = json['Nurse_Flag'];
    patientFlag = json['Patient_Flag'];
    if (json['ClincialList'] != null) {
      clincialList = <ClincialList>[];
      json['ClincialList'].forEach((v) {
        clincialList!.add(new ClincialList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Summary_id'] = this.summaryId;
    data['Pulse'] = this.pulse;
    data['Disease_name'] = this.diseaseName;
    data['Allergies'] = this.allergies;
    data['Symptoms'] = this.symptoms;
    data['Height'] = this.height;
    data['Weight'] = this.weight;
    data['Temp'] = this.temp;
    data['Diagnoses'] = this.diagnoses;
    data['Causes'] = this.causes;
    data['Investigation'] = this.investigation;
    data['Notes'] = this.notes;
    data['Doctor_id'] = this.doctorId;
    data['Appointment_id'] = this.appointmentId;
    data['User_id'] = this.userId;
    data['Status_Flag'] = this.statusFlag;
    data['Insert_Date'] = this.insertDate;
    data['Diet_And_Exercise'] = this.dietAndExercise;
    data['BP_Systolic'] = this.bPSystolic;
    data['BP_Diastolic'] = this.bPDiastolic;
    data['Waist'] = this.waist;
    data['Hip'] = this.hip;
    data['SPO2'] = this.sPO2;
    data['BMI'] = this.bMI;
    data['Nurse_Id'] = this.nurseId;
    data['Doctor_Flag'] = this.doctorFlag;
    data['Nurse_Flag'] = this.nurseFlag;
    data['Patient_Flag'] = this.patientFlag;
    if (this.clincialList != null) {
      data['ClincialList'] = this.clincialList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

// class Datum {
//   int vitalSignsId;
//   int patientId;
//   int doctorId;
//   int appointmentId;
//   String dietAndExercise;
//   String bpSystolic;
//   String bpDiastolic;
//   String pulse;
//   String height;
//   String weight;
//   String waist;
//   String hip;
//   String temperture;
//   String spo2;
//   String bmi;
//   String notes;
//   String diagnosis;
//   dynamic appointmentDate;
//
//   Datum({
//     required this.vitalSignsId,
//     required this.patientId,
//     required this.doctorId,
//     required this.appointmentId,
//     required this.dietAndExercise,
//     required this.bpSystolic,
//     required this.bpDiastolic,
//     required this.pulse,
//     required this.height,
//     required this.weight,
//     required this.waist,
//     required this.hip,
//     required this.temperture,
//     required this.spo2,
//     required this.bmi,
//     required this.notes,
//     required this.diagnosis,
//     required this.appointmentDate,
//   });
//
//   factory Datum.fromJson(Map<String, dynamic> json) => Datum(
//         vitalSignsId: json["Vital_Signs_Id"],
//         patientId: json["Patient_Id"],
//         doctorId: json["Doctor_Id"],
//         appointmentId: json["Appointment_Id"],
//         dietAndExercise: json["Diet_And_Exercise"],
//         bpSystolic: json["BP_Systolic"],
//         bpDiastolic: json["BP_Diastolic"],
//         pulse: json["Pulse"],
//         height: json["Height"],
//         weight: json["Weight"],
//         waist: json["Waist"],
//         hip: json["Hip"],
//         temperture: json["Temperture"],
//         spo2: json["SPO2"],
//         bmi: json["BMI"],
//         notes: json["Notes"],
//         diagnosis: json["Diagnosis"],
//         appointmentDate: json["Appointment_Date"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "Vital_Signs_Id": vitalSignsId,
//         "Patient_Id": patientId,
//         "Doctor_Id": doctorId,
//         "Appointment_Id": appointmentId,
//         "Diet_And_Exercise": dietAndExercise,
//         "BP_Systolic": bpSystolic,
//         "BP_Diastolic": bpDiastolic,
//         "Pulse": pulse,
//         "Height": height,
//         "Weight": weight,
//         "Waist": waist,
//         "Hip": hip,
//         "Temperture": temperture,
//         "SPO2": spo2,
//         "BMI": bmi,
//         "Notes": notes,
//         "Diagnosis": diagnosis,
//         "Appointment_Date": appointmentDate,
//       };
// }

class ClincialList {
  int? summaryId;
  String? pulse;
  String? diseaseName;
  String? allergies;
  String? symptoms;
  String? height;
  String? weight;
  String? temp;
  String? diagnoses;
  String? causes;
  String? investigation;
  String? notes;
  int? doctorId;
  int? appointmentId;
  int? userId;
  int? statusFlag;
  String? insertDate;
  String? dietAndExercise;
  String? bPSystolic;
  String? bPDiastolic;
  String? waist;
  String? hip;
  String? sPO2;
  String? bMI;
  int? nurseId;
  int? doctorFlag;
  int? nurseFlag;
  int? patientFlag;
  Null? clincialList;

  ClincialList(
      {this.summaryId,
        this.pulse,
        this.diseaseName,
        this.allergies,
        this.symptoms,
        this.height,
        this.weight,
        this.temp,
        this.diagnoses,
        this.causes,
        this.investigation,
        this.notes,
        this.doctorId,
        this.appointmentId,
        this.userId,
        this.statusFlag,
        this.insertDate,
        this.dietAndExercise,
        this.bPSystolic,
        this.bPDiastolic,
        this.waist,
        this.hip,
        this.sPO2,
        this.bMI,
        this.nurseId,
        this.doctorFlag,
        this.nurseFlag,
        this.patientFlag,
        this.clincialList});

  ClincialList.fromJson(Map<String, dynamic> json) {
    summaryId = json['Summary_id'];
    pulse = json['Pulse'];
    diseaseName = json['Disease_name'];
    allergies = json['Allergies'];
    symptoms = json['Symptoms'];
    height = json['Height'];
    weight = json['Weight'];
    temp = json['Temp'];
    diagnoses = json['Diagnoses'];
    causes = json['Causes'];
    investigation = json['Investigation'];
    notes = json['Notes'];
    doctorId = json['Doctor_id'];
    appointmentId = json['Appointment_id'];
    userId = json['User_id'];
    statusFlag = json['Status_Flag'];
    insertDate = json['Insert_Date'];
    dietAndExercise = json['Diet_And_Exercise'];
    bPSystolic = json['BP_Systolic'];
    bPDiastolic = json['BP_Diastolic'];
    waist = json['Waist'];
    hip = json['Hip'];
    sPO2 = json['SPO2'];
    bMI = json['BMI'];
    nurseId = json['Nurse_Id'];
    doctorFlag = json['Doctor_Flag'];
    nurseFlag = json['Nurse_Flag'];
    patientFlag = json['Patient_Flag'];
    clincialList = json['ClincialList'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Summary_id'] = this.summaryId;
    data['Pulse'] = this.pulse;
    data['Disease_name'] = this.diseaseName;
    data['Allergies'] = this.allergies;
    data['Symptoms'] = this.symptoms;
    data['Height'] = this.height;
    data['Weight'] = this.weight;
    data['Temp'] = this.temp;
    data['Diagnoses'] = this.diagnoses;
    data['Causes'] = this.causes;
    data['Investigation'] = this.investigation;
    data['Notes'] = this.notes;
    data['Doctor_id'] = this.doctorId;
    data['Appointment_id'] = this.appointmentId;
    data['User_id'] = this.userId;
    data['Status_Flag'] = this.statusFlag;
    data['Insert_Date'] = this.insertDate;
    data['Diet_And_Exercise'] = this.dietAndExercise;
    data['BP_Systolic'] = this.bPSystolic;
    data['BP_Diastolic'] = this.bPDiastolic;
    data['Waist'] = this.waist;
    data['Hip'] = this.hip;
    data['SPO2'] = this.sPO2;
    data['BMI'] = this.bMI;
    data['Nurse_Id'] = this.nurseId;
    data['Doctor_Flag'] = this.doctorFlag;
    data['Nurse_Flag'] = this.nurseFlag;
    data['Patient_Flag'] = this.patientFlag;
    data['ClincialList'] = this.clincialList;
    return data;
  }
}
