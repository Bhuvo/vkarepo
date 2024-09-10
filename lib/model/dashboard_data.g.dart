// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DashboardData _$$_DashboardDataFromJson(Map<String, dynamic> json) =>
    _$_DashboardData(
      patient: json['Total_Patient_Count'] as String?,
      inr: json['Today_INR_Count'] as String?,
      pending: json['Today_Pending_Count'] as String?,
      completed: json['Today_Completed_Count'] as String?,
      totalPending: json['Total_Pending_Count'] as String?,
    );

Map<String, dynamic> _$$_DashboardDataToJson(_$_DashboardData instance) =>
    <String, dynamic>{
      'Total_Patient_Count': instance.patient,
      'Today_INR_Count': instance.inr,
      'Today_Pending_Count': instance.pending,
      'Today_Completed_Count': instance.completed,
      'Total_Pending_Count': instance.totalPending,
    };
