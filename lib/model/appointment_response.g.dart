// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppointmentResponseImpl _$$AppointmentResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$AppointmentResponseImpl(
      previous: (json['PreviousAppointmentList'] as List<dynamic>?)
          ?.map((e) => AppointmentData.fromJson(e as Map<String, dynamic>))
          .toList(),
      upcoming: (json['UpcomingAppointmentList'] as List<dynamic>?)
          ?.map((e) => AppointmentData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$AppointmentResponseImplToJson(
        _$AppointmentResponseImpl instance) =>
    <String, dynamic>{
      'PreviousAppointmentList': instance.previous,
      'UpcomingAppointmentList': instance.upcoming,
    };
