import 'package:freezed_annotation/freezed_annotation.dart';

part 'time_list.freezed.dart';
part 'time_list.g.dart';

@freezed
class TimeList with _$TimeList {
  const factory TimeList({
  @Default('') dynamic Clinic_id,
  @Default('') dynamic FromTime,
  @Default('') dynamic Doctor_id,
  @Default('') dynamic startSplit,
  @Default('') dynamic EndSplit,
  @Default('') dynamic ToTime,
  @Default('') dynamic Day,
  @Default('') dynamic Days,
  @Default('') dynamic Dayslot,
  @Default('') dynamic Class
  }) = _TimeList;
  static const fromJsonFactory = _$TimeListFromJson;
  factory TimeList.fromJson(Map<String, dynamic> json) =>
      _$TimeListFromJson(json);
}