import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_data.freezed.dart';
part 'dashboard_data.g.dart';

@freezed
class DashboardData with _$DashboardData {
  const factory DashboardData({
    @JsonKey(name: 'Total_Patient_Count') String? patient,
    @JsonKey(name: 'Today_INR_Count') String? inr,
    @JsonKey(name: 'Today_Pending_Count') String? pending,
    @JsonKey(name: 'Today_Completed_Count') String? completed,
    @JsonKey(name: 'Total_Pending_Count') String? totalPending,
  }) = _DashboardData;
  static const fromJsonFactory = _$DashboardDataFromJson;
  factory DashboardData.fromJson(Map<String, dynamic> json) =>
      _$DashboardDataFromJson(json);
}

// "Total_Patient_Count": "2",
// "Today_INR_Count": "0",
// "Today_Pending_Count": "0",
// "Today_Completed_Count": "0",
// "Total_Pending_Count": "0"