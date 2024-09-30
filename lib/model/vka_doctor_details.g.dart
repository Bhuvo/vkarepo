// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vka_doctor_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VkaDoctorDetailsImpl _$$VkaDoctorDetailsImplFromJson(
        Map<String, dynamic> json) =>
    _$VkaDoctorDetailsImpl(
      doctorId: (json['doctorId'] as num?)?.toInt(),
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

Map<String, dynamic> _$$VkaDoctorDetailsImplToJson(
        _$VkaDoctorDetailsImpl instance) =>
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
