// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_hospital_timing_by_doctor_hospital.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetHospitalTimingByDoctorHospitalImpl
    _$$GetHospitalTimingByDoctorHospitalImplFromJson(
            Map<String, dynamic> json) =>
        _$GetHospitalTimingByDoctorHospitalImpl(
          videoTimingId: (json['VideoTiming_id'] as num?)?.toInt(),
          day: json['Day'] as String?,
          hospitalId: (json['Hospital_id'] as num?)?.toInt(),
          hospitalName: json['Hospital_Name'] ?? null,
          fromTime: json['FromTime'] as String?,
          toTime: json['ToTime'] as String?,
          daysGet: json['Days_Get'] ?? null,
          doctorImage: json['Doctor_Image'] ?? null,
          doctorName: json['Doctor_Name'] ?? null,
          doctorId: (json['Doctor_id'] as num?)?.toInt(),
          doctorFee: (json['DoctorFee'] as num?)?.toInt(),
          setInterval: (json['SetInterval'] as num?)?.toInt(),
          days: json['Days'] as String?,
          hospitalDetailsId: (json['HospitalDetails_id'] as num?)?.toInt(),
          status: json['Status'] ?? null,
          listTiming: (json['ListTiming'] as List<dynamic>?)
                  ?.map((e) => GetHospitalTimingByDoctorHospital.fromJson(
                      e as Map<String, dynamic>))
                  .toList() ??
              null,
        );

Map<String, dynamic> _$$GetHospitalTimingByDoctorHospitalImplToJson(
        _$GetHospitalTimingByDoctorHospitalImpl instance) =>
    <String, dynamic>{
      'VideoTiming_id': instance.videoTimingId,
      'Day': instance.day,
      'Hospital_id': instance.hospitalId,
      'Hospital_Name': instance.hospitalName,
      'FromTime': instance.fromTime,
      'ToTime': instance.toTime,
      'Days_Get': instance.daysGet,
      'Doctor_Image': instance.doctorImage,
      'Doctor_Name': instance.doctorName,
      'Doctor_id': instance.doctorId,
      'DoctorFee': instance.doctorFee,
      'SetInterval': instance.setInterval,
      'Days': instance.days,
      'HospitalDetails_id': instance.hospitalDetailsId,
      'Status': instance.status,
      'ListTiming': instance.listTiming,
    };
