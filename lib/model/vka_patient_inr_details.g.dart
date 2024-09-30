// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vka_patient_inr_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VKAPatientINRDetailsImpl _$$VKAPatientINRDetailsImplFromJson(
        Map<String, dynamic> json) =>
    _$VKAPatientINRDetailsImpl(
      inrDetailsId: (json['inrDetailsId'] as num?)?.toInt(),
      doctorId: json['doctorId'] as String?,
      patientId: json['patientId'] as String?,
      date: json['date'] as String?,
      ptPatient: json['ptPatient'] as String?,
      ptControl: json['ptControl'] as String?,
      inr: json['inr'] as String?,
      mon: json['mon'] as String?,
      tue: json['tue'] as String?,
      wed: json['wed'] as String?,
      thu: json['thu'] as String?,
      fri: json['fri'] as String?,
      sat: json['sat'] as String?,
      sun: json['sun'] as String?,
      targetInr: json['targetInr'] as String?,
      nextTest: json['nextTest'] as String?,
      diagnosis: json['diagnosis'] as String?,
      drug: json['drug'] as String?,
      doctorActiveFlag: json['doctorActiveFlag'] as String?,
      patientActiveFlag: json['patientActiveFlag'] as String?,
      activeFlag: json['activeFlag'] as String?,
      insertDate: json['insertDate'] as String?,
      notes: json['Notes'] ?? null,
      days: (json['days'] as num?)?.toInt(),
      symbolName: json['symbolName'] as String?,
      inrDetailsList: json['inrDetailsList'],
      patientRegistrationList: json['patientRegistrationList'],
    );

Map<String, dynamic> _$$VKAPatientINRDetailsImplToJson(
        _$VKAPatientINRDetailsImpl instance) =>
    <String, dynamic>{
      'inrDetailsId': instance.inrDetailsId,
      'doctorId': instance.doctorId,
      'patientId': instance.patientId,
      'date': instance.date,
      'ptPatient': instance.ptPatient,
      'ptControl': instance.ptControl,
      'inr': instance.inr,
      'mon': instance.mon,
      'tue': instance.tue,
      'wed': instance.wed,
      'thu': instance.thu,
      'fri': instance.fri,
      'sat': instance.sat,
      'sun': instance.sun,
      'targetInr': instance.targetInr,
      'nextTest': instance.nextTest,
      'diagnosis': instance.diagnosis,
      'drug': instance.drug,
      'doctorActiveFlag': instance.doctorActiveFlag,
      'patientActiveFlag': instance.patientActiveFlag,
      'activeFlag': instance.activeFlag,
      'insertDate': instance.insertDate,
      'Notes': instance.notes,
      'days': instance.days,
      'symbolName': instance.symbolName,
      'inrDetailsList': instance.inrDetailsList,
      'patientRegistrationList': instance.patientRegistrationList,
    };
