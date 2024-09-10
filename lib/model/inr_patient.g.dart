// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inr_patient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_InrPatient _$$_InrPatientFromJson(Map<String, dynamic> json) =>
    _$_InrPatient(
      Patient_Id: json['Patient_Id'] as num?,
      Patient_Registration_Number:
          json['Patient_Registration_Number'] as String?,
      First_Name: json['First_Name'] as String?,
      Last_Name: json['Last_Name'] as String?,
      DOB: json['DOB'] as String?,
      Age: json['Age'] as String?,
      Gender: json['Gender'] as String?,
      Phone_Number: json['Phone_Number'] as String?,
      Watsapp_Number: json['Watsapp_Number'] as String?,
      EMail_Id: json['EMail_Id'] as String?,
      Time_in_Therapeutic_Ratio: json['Time_in_Therapeutic_Ratio'] ?? null,
      Password: json['Password'] as String?,
      Doctor_Id: json['Doctor_Id'] as String?,
      Traget_INR_From: json['Traget_INR_From'] as String?,
      Traget_INR_To: json['Traget_INR_To'] as String?,
      Date: json['Date'] ?? null,
      Doctor_ActiveFlag: json['Doctor_ActiveFlag'] ?? null,
      Patient_ActiveFlag: json['Patient_ActiveFlag'] ?? null,
      PatientRegistration_list: json['PatientRegistration_list'] ?? null,
    );

Map<String, dynamic> _$$_InrPatientToJson(_$_InrPatient instance) =>
    <String, dynamic>{
      'Patient_Id': instance.Patient_Id,
      'Patient_Registration_Number': instance.Patient_Registration_Number,
      'First_Name': instance.First_Name,
      'Last_Name': instance.Last_Name,
      'DOB': instance.DOB,
      'Age': instance.Age,
      'Gender': instance.Gender,
      'Phone_Number': instance.Phone_Number,
      'Watsapp_Number': instance.Watsapp_Number,
      'EMail_Id': instance.EMail_Id,
      'Time_in_Therapeutic_Ratio': instance.Time_in_Therapeutic_Ratio,
      'Password': instance.Password,
      'Doctor_Id': instance.Doctor_Id,
      'Traget_INR_From': instance.Traget_INR_From,
      'Traget_INR_To': instance.Traget_INR_To,
      'Date': instance.Date,
      'Doctor_ActiveFlag': instance.Doctor_ActiveFlag,
      'Patient_ActiveFlag': instance.Patient_ActiveFlag,
      'PatientRegistration_list': instance.PatientRegistration_list,
    };
