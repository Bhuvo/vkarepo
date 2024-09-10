// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Patient _$$_PatientFromJson(Map<String, dynamic> json) => _$_Patient(
      id: json['Patient_Id'] ?? null,
      userId: json['User_id'] ?? null,
      regNo: json['Patient_Registration_Number'] as String?,
      firstName: json['First_Name'] as String?,
      relationName: json['RelationName'] as String?,
      lastName: json['Last_Name'] as String?,
      patientName: json['PatientName'] as String?,
      userName: json['User_Name'] as String?,
      dob: json['DOB'] as String?,
      age: json['Age'] ?? null,
      gender: json['Gender'] as String?,
      patientImage: json['Image'] ?? null,
      phone: json['Phone_Number'] as String?,
      familyMemberId: json['FamilyMember_id'] ?? null,
      primaryAccountNo: json['PrimaryAccount_No'] as int?,
      primaryMobile: json['PrimaryMobile'] as String?,
      primaryUserId: json['Primary_User_id'] ?? null,
      mobile: json['MobileNumber'] as String?,
      whatsapp: json['Watsapp_Number'] as String?,
      email: json['EMail_Id'] as String?,
      emailId: json['EmailID'] as String?,
      ttr: json['Time_in_Therapeutic_Ratio'] as String?,
      password: json['Password'] as String?,
      doctorId: json['Doctor_Id'] ?? null,
      inrFrom: json['Traget_INR_From'] as String?,
      inrTo: json['Traget_INR_To'] as String?,
      date: json['Date'] as String?,
      doctorActive: json['Doctor_ActiveFlag'] as String?,
      patientActive: json['Patient_ActiveFlag'] as String?,
      patientRegistrationList: json['PatientRegistration_list'] as String?,
    );

Map<String, dynamic> _$$_PatientToJson(_$_Patient instance) =>
    <String, dynamic>{
      'Patient_Id': instance.id,
      'User_id': instance.userId,
      'Patient_Registration_Number': instance.regNo,
      'First_Name': instance.firstName,
      'RelationName': instance.relationName,
      'Last_Name': instance.lastName,
      'PatientName': instance.patientName,
      'User_Name': instance.userName,
      'DOB': instance.dob,
      'Age': instance.age,
      'Gender': instance.gender,
      'Image': instance.patientImage,
      'Phone_Number': instance.phone,
      'FamilyMember_id': instance.familyMemberId,
      'PrimaryAccount_No': instance.primaryAccountNo,
      'PrimaryMobile': instance.primaryMobile,
      'Primary_User_id': instance.primaryUserId,
      'MobileNumber': instance.mobile,
      'Watsapp_Number': instance.whatsapp,
      'EMail_Id': instance.email,
      'EmailID': instance.emailId,
      'Time_in_Therapeutic_Ratio': instance.ttr,
      'Password': instance.password,
      'Doctor_Id': instance.doctorId,
      'Traget_INR_From': instance.inrFrom,
      'Traget_INR_To': instance.inrTo,
      'Date': instance.date,
      'Doctor_ActiveFlag': instance.doctorActive,
      'Patient_ActiveFlag': instance.patientActive,
      'PatientRegistration_list': instance.patientRegistrationList,
    };
