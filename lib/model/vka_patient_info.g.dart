// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vka_patient_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VkaPatientInfoImpl _$$VkaPatientInfoImplFromJson(Map<String, dynamic> json) =>
    _$VkaPatientInfoImpl(
      patientId: (json['patientId'] as num?)?.toInt(),
      patientRegistrationNumber: json['patientRegistrationNumber'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      dob: json['dob'] as String?,
      age: json['age'] as String?,
      gender: json['gender'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      watsappNumber: json['watsappNumber'] as String?,
      eMailId: json['eMailId'] as String?,
      timeInTherapeuticRatio: json['timeInTherapeuticRatio'],
      password: json['password'] as String?,
      doctorId: json['doctorId'] as String?,
      tragetInrFrom: json['tragetInrFrom'],
      tragetInrTo: json['tragetInrTo'],
      date: json['date'],
      doctorActiveFlag: json['doctorActiveFlag'],
      patientActiveFlag: json['patientActiveFlag'],
      patientRegistrationList: json['patientRegistrationList'],
    );

Map<String, dynamic> _$$VkaPatientInfoImplToJson(
        _$VkaPatientInfoImpl instance) =>
    <String, dynamic>{
      'patientId': instance.patientId,
      'patientRegistrationNumber': instance.patientRegistrationNumber,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'dob': instance.dob,
      'age': instance.age,
      'gender': instance.gender,
      'phoneNumber': instance.phoneNumber,
      'watsappNumber': instance.watsappNumber,
      'eMailId': instance.eMailId,
      'timeInTherapeuticRatio': instance.timeInTherapeuticRatio,
      'password': instance.password,
      'doctorId': instance.doctorId,
      'tragetInrFrom': instance.tragetInrFrom,
      'tragetInrTo': instance.tragetInrTo,
      'date': instance.date,
      'doctorActiveFlag': instance.doctorActiveFlag,
      'patientActiveFlag': instance.patientActiveFlag,
      'patientRegistrationList': instance.patientRegistrationList,
    };
