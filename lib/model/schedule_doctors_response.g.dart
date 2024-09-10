// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_doctors_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ScheduleDoctorsResponse _$$_ScheduleDoctorsResponseFromJson(
        Map<String, dynamic> json) =>
    _$_ScheduleDoctorsResponse(
      doctors: (json['DoctorInfo'] as List<dynamic>?)
          ?.map((e) => InstantDoctor.fromJson(e as Map<String, dynamic>))
          .toList(),
      clinics: (json['ClinicFee'] as List<dynamic>?)
          ?.map((e) => Clinic.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ScheduleDoctorsResponseToJson(
        _$_ScheduleDoctorsResponse instance) =>
    <String, dynamic>{
      'DoctorInfo': instance.doctors,
      'ClinicFee': instance.clinics,
    };
