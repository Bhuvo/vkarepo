// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_patient_waiting.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UpdatePatientWaitingImpl _$$UpdatePatientWaitingImplFromJson(
        Map<String, dynamic> json) =>
    _$UpdatePatientWaitingImpl(
      responseCode: (json['responseCode'] as num).toInt(),
      waitingMinutes: (json['waitingMinutes'] as num).toInt(),
      queue: (json['queue'] as num).toInt(),
      totalQueue: (json['totalQueue'] as num).toInt(),
      dayEndFlag: json['dayEndFlag'] as String,
      doctorOnline: json['doctorOnline'] as String,
    );

Map<String, dynamic> _$$UpdatePatientWaitingImplToJson(
        _$UpdatePatientWaitingImpl instance) =>
    <String, dynamic>{
      'responseCode': instance.responseCode,
      'waitingMinutes': instance.waitingMinutes,
      'queue': instance.queue,
      'totalQueue': instance.totalQueue,
      'dayEndFlag': instance.dayEndFlag,
      'doctorOnline': instance.doctorOnline,
    };
