// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vka_doctor_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_VkaDoctorDetails _$$_VkaDoctorDetailsFromJson(Map<String, dynamic> json) =>
    _$_VkaDoctorDetails(
      doctorId: json['doctorId'] as int?,
      name: json['name'] as String?,
      qualification: json['qualification'] ?? null,
      hospitalName: json['hospitalName'] ?? null,
      phoneNumber: json['phoneNumber'] as String?,
      watsappNumber: json['watsappNumber'] ?? null,
      hospitalNumber: json['hospitalNumber'] as String?,
      eMailId: json['eMailId'] as String?,
      password: json['password'] ?? null,
      activeFlag: json['activeFlag'] ?? null,
      doctorRegistrationList: (json['doctorRegistrationList'] as List<dynamic>?)
              ?.map((e) => VkaDoctorDetails.fromJson(e as Map<String, dynamic>))
              .toList() ??
          null,
    );

Map<String, dynamic> _$$_VkaDoctorDetailsToJson(_$_VkaDoctorDetails instance) =>
    <String, dynamic>{
      'doctorId': instance.doctorId,
      'name': instance.name,
      'qualification': instance.qualification,
      'hospitalName': instance.hospitalName,
      'phoneNumber': instance.phoneNumber,
      'watsappNumber': instance.watsappNumber,
      'hospitalNumber': instance.hospitalNumber,
      'eMailId': instance.eMailId,
      'password': instance.password,
      'activeFlag': instance.activeFlag,
      'doctorRegistrationList': instance.doctorRegistrationList,
    };
