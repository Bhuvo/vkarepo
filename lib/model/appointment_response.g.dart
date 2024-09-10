// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AppointmentResponse _$$_AppointmentResponseFromJson(
        Map<String, dynamic> json) =>
    _$_AppointmentResponse(
      previous: (json['PreviousAppointmentList'] as List<dynamic>?)
          ?.map((e) => AppointmentData.fromJson(e as Map<String, dynamic>))
          .toList(),
      upcoming: (json['UpcomingAppointmentList'] as List<dynamic>?)
          ?.map((e) => AppointmentData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_AppointmentResponseToJson(
        _$_AppointmentResponse instance) =>
    <String, dynamic>{
      'PreviousAppointmentList': instance.previous,
      'UpcomingAppointmentList': instance.upcoming,
    };
