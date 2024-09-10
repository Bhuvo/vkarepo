// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'instant_doctors_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_InstantDoctorsResponse _$$_InstantDoctorsResponseFromJson(
        Map<String, dynamic> json) =>
    _$_InstantDoctorsResponse(
      doctors: (json['DFSendList'] as List<dynamic>?)
          ?.map((e) => InstantDoctor.fromJson(e as Map<String, dynamic>))
          .toList(),
      clinics: (json['ClinicFee'] as List<dynamic>?)
          ?.map((e) => Clinic.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_InstantDoctorsResponseToJson(
        _$_InstantDoctorsResponse instance) =>
    <String, dynamic>{
      'DFSendList': instance.doctors,
      'ClinicFee': instance.clinics,
    };
