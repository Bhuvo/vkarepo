// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_doctors_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ScheduleDoctorsResponseImpl _$$ScheduleDoctorsResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ScheduleDoctorsResponseImpl(
      doctors: (json['DoctorInfo'] as List<dynamic>?)
          ?.map((e) => InstantDoctor.fromJson(e as Map<String, dynamic>))
          .toList(),
      clinics: (json['ClinicFee'] as List<dynamic>?)
          ?.map((e) => Clinic.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ScheduleDoctorsResponseImplToJson(
        _$ScheduleDoctorsResponseImpl instance) =>
    <String, dynamic>{
      'DoctorInfo': instance.doctors,
      'ClinicFee': instance.clinics,
    };
