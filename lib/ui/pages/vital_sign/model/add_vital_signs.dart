// To parse this JSON data, do
//
//     final addVitalSignModel = addVitalSignModelFromJson(jsonString);

import 'dart:convert';

AddVitalSignModel addVitalSignModelFromJson(String str) =>
    AddVitalSignModel.fromJson(json.decode(str));

String addVitalSignModelToJson(AddVitalSignModel data) =>
    json.encode(data.toJson());

class AddVitalSignModel {
  int responseCode;
  String responseMessage;
  int data;

  AddVitalSignModel({
    required this.responseCode,
    required this.responseMessage,
    required this.data,
  });

  factory AddVitalSignModel.fromJson(Map<String, dynamic> json) =>
      AddVitalSignModel(
        responseCode: json["ResponseCode"],
        responseMessage: json["ResponseMessage"],
        data: json["Data"],
      );

  Map<String, dynamic> toJson() => {
        "ResponseCode": responseCode,
        "ResponseMessage": responseMessage,
        "Data": data,
      };
}
