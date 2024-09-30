// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'instant_doctors_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InstantDoctorsResponseImpl _$$InstantDoctorsResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$InstantDoctorsResponseImpl(
      doctors: (json['DFSendList'] as List<dynamic>?)
          ?.map((e) => InstantDoctor.fromJson(e as Map<String, dynamic>))
          .toList(),
      clinics: (json['ClinicFee'] as List<dynamic>?)
          ?.map((e) => Clinic.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$InstantDoctorsResponseImplToJson(
        _$InstantDoctorsResponseImpl instance) =>
    <String, dynamic>{
      'DFSendList': instance.doctors,
      'ClinicFee': instance.clinics,
    };
