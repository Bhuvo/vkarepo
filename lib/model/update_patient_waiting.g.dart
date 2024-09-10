// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_patient_waiting.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UpdatePatientWaiting _$$_UpdatePatientWaitingFromJson(
        Map<String, dynamic> json) =>
    _$_UpdatePatientWaiting(
      responseCode: json['responseCode'] as int,
      waitingMinutes: json['waitingMinutes'] as int,
      queue: json['queue'] as int,
      totalQueue: json['totalQueue'] as int,
      dayEndFlag: json['dayEndFlag'] as String,
      doctorOnline: json['doctorOnline'] as String,
    );

Map<String, dynamic> _$$_UpdatePatientWaitingToJson(
        _$_UpdatePatientWaiting instance) =>
    <String, dynamic>{
      'responseCode': instance.responseCode,
      'waitingMinutes': instance.waitingMinutes,
      'queue': instance.queue,
      'totalQueue': instance.totalQueue,
      'dayEndFlag': instance.dayEndFlag,
      'doctorOnline': instance.doctorOnline,
    };
