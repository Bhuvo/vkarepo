// To parse this JSON data, do
//
//     final getVitalSignsModel = getVitalSignsModelFromJson(jsonString);

import 'dart:convert';

GetVitalSignsModel getVitalSignsModelFromJson(String str) =>
    GetVitalSignsModel.fromJson(json.decode(str));

String getVitalSignsModelToJson(GetVitalSignsModel data) =>
    json.encode(data.toJson());

class GetVitalSignsModel {
  int responseCode;
  String responseMessage;
  Data data;

  GetVitalSignsModel({
    required this.responseCode,
    required this.responseMessage,
    required this.data,
  });

  factory GetVitalSignsModel.fromJson(Map<String, dynamic> json) =>
      GetVitalSignsModel(
        responseCode: json["ResponseCode"],
        responseMessage: json["ResponseMessage"],
        data: Data.fromJson(json["Data"]),
      );

  Map<String, dynamic> toJson() => {
        "ResponseCode": responseCode,
        "ResponseMessage": responseMessage,
        "Data": data.toJson(),
      };
}

class Data {
  int summaryId;
  dynamic pulse;
  dynamic diseaseName;
  dynamic allergies;
  dynamic symptoms;
  dynamic height;
  dynamic weight;
  dynamic temp;
  dynamic diagnoses;
  dynamic causes;
  dynamic investigation;
  dynamic notes;
  int doctorId;
  int appointmentId;
  int userId;
  dynamic statusFlag;
  dynamic insertDate;
  dynamic dietAndExercise;
  dynamic bpSystolic;
  dynamic bpDiastolic;
  dynamic waist;
  dynamic hip;
  dynamic spo2;
  dynamic bmi;
  int nurseId;
  int doctorFlag;
  int nurseFlag;
  List<dynamic> clincialList;

  Data({
    required this.summaryId,
    required this.pulse,
    required this.diseaseName,
    required this.allergies,
    required this.symptoms,
    required this.height,
    required this.weight,
    required this.temp,
    required this.diagnoses,
    required this.causes,
    required this.investigation,
    required this.notes,
    required this.doctorId,
    required this.appointmentId,
    required this.userId,
    required this.statusFlag,
    required this.insertDate,
    required this.dietAndExercise,
    required this.bpSystolic,
    required this.bpDiastolic,
    required this.waist,
    required this.hip,
    required this.spo2,
    required this.bmi,
    required this.nurseId,
    required this.doctorFlag,
    required this.nurseFlag,
    required this.clincialList,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        summaryId: json["Summary_id"],
        pulse: json["Pulse"],
        diseaseName: json["Disease_name"],
        allergies: json["Allergies"],
        symptoms: json["Symptoms"],
        height: json["Height"],
        weight: json["Weight"],
        temp: json["Temp"],
        diagnoses: json["Diagnoses"],
        causes: json["Causes"],
        investigation: json["Investigation"],
        notes: json["Notes"],
        doctorId: json["Doctor_id"],
        appointmentId: json["Appointment_id"],
        userId: json["User_id"],
        statusFlag: json["Status_Flag"],
        insertDate: json["Insert_Date"],
        dietAndExercise: json["Diet_And_Exercise"],
        bpSystolic: json["BP_Systolic"],
        bpDiastolic: json["BP_Diastolic"],
        waist: json["Waist"],
        hip: json["Hip"],
        spo2: json["SPO2"],
        bmi: json["BMI"],
        nurseId: json["Nurse_Id"],
        doctorFlag: json["Doctor_Flag"],
        nurseFlag: json["Nurse_Flag"],
        clincialList: List<dynamic>.from(json["ClincialList"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "Summary_id": summaryId,
        "Pulse": pulse,
        "Disease_name": diseaseName,
        "Allergies": allergies,
        "Symptoms": symptoms,
        "Height": height,
        "Weight": weight,
        "Temp": temp,
        "Diagnoses": diagnoses,
        "Causes": causes,
        "Investigation": investigation,
        "Notes": notes,
        "Doctor_id": doctorId,
        "Appointment_id": appointmentId,
        "User_id": userId,
        "Status_Flag": statusFlag,
        "Insert_Date": insertDate,
        "Diet_And_Exercise": dietAndExercise,
        "BP_Systolic": bpSystolic,
        "BP_Diastolic": bpDiastolic,
        "Waist": waist,
        "Hip": hip,
        "SPO2": spo2,
        "BMI": bmi,
        "Nurse_Id": nurseId,
        "Doctor_Flag": doctorFlag,
        "Nurse_Flag": nurseFlag,
        "ClincialList": List<dynamic>.from(clincialList.map((x) => x)),
      };
}
