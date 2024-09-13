// To parse this JSON data, do
//
//     final vitalSignsChartModel = vitalSignsChartModelFromJson(jsonString);

import 'dart:convert';

VitalSignsChartModel vitalSignsChartModelFromJson(String str) =>
    VitalSignsChartModel.fromJson(json.decode(str));

String vitalSignsChartModelToJson(VitalSignsChartModel data) =>
    json.encode(data.toJson());

class VitalSignsChartModel {
  List<Datum> data;
  String responseCode;
  String responseMessage;

  VitalSignsChartModel({
    required this.data,
    required this.responseCode,
    required this.responseMessage,
  });

  factory VitalSignsChartModel.fromJson(Map<String, dynamic> json) =>
      VitalSignsChartModel(
        data: List<Datum>.from(json["Data"].map((x) => Datum.fromJson(x))),
        responseCode: json["ResponseCode"],
        responseMessage: json["ResponseMessage"],
      );

  Map<String, dynamic> toJson() => {
        "Data": List<dynamic>.from(data.map((x) => x.toJson())),
        "ResponseCode": responseCode,
        "ResponseMessage": responseMessage,
      };
}

class Datum {
  int vitalSignsId;
  int patientId;
  int doctorId;
  int appointmentId;
  String dietAndExercise;
  String bpSystolic;
  String bpDiastolic;
  String pulse;
  String height;
  String weight;
  String waist;
  String hip;
  String temperture;
  String spo2;
  String bmi;
  String notes;
  String diagnosis;
  dynamic appointmentDate;

  Datum({
    required this.vitalSignsId,
    required this.patientId,
    required this.doctorId,
    required this.appointmentId,
    required this.dietAndExercise,
    required this.bpSystolic,
    required this.bpDiastolic,
    required this.pulse,
    required this.height,
    required this.weight,
    required this.waist,
    required this.hip,
    required this.temperture,
    required this.spo2,
    required this.bmi,
    required this.notes,
    required this.diagnosis,
    required this.appointmentDate,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        vitalSignsId: json["Vital_Signs_Id"],
        patientId: json["Patient_Id"],
        doctorId: json["Doctor_Id"],
        appointmentId: json["Appointment_Id"],
        dietAndExercise: json["Diet_And_Exercise"],
        bpSystolic: json["BP_Systolic"],
        bpDiastolic: json["BP_Diastolic"],
        pulse: json["Pulse"],
        height: json["Height"],
        weight: json["Weight"],
        waist: json["Waist"],
        hip: json["Hip"],
        temperture: json["Temperture"],
        spo2: json["SPO2"],
        bmi: json["BMI"],
        notes: json["Notes"],
        diagnosis: json["Diagnosis"],
        appointmentDate: json["Appointment_Date"],
      );

  Map<String, dynamic> toJson() => {
        "Vital_Signs_Id": vitalSignsId,
        "Patient_Id": patientId,
        "Doctor_Id": doctorId,
        "Appointment_Id": appointmentId,
        "Diet_And_Exercise": dietAndExercise,
        "BP_Systolic": bpSystolic,
        "BP_Diastolic": bpDiastolic,
        "Pulse": pulse,
        "Height": height,
        "Weight": weight,
        "Waist": waist,
        "Hip": hip,
        "Temperture": temperture,
        "SPO2": spo2,
        "BMI": bmi,
        "Notes": notes,
        "Diagnosis": diagnosis,
        "Appointment_Date": appointmentDate,
      };
}
