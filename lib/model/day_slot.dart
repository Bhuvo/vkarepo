import 'package:freezed_annotation/freezed_annotation.dart';

part 'day_slot.freezed.dart';
part 'day_slot.g.dart';

@freezed
class DaySlot with _$DaySlot {
  const factory DaySlot({
  @Default('') dynamic Time,
  @Default('') dynamic FromTime,
  @Default('') dynamic ToTime,
  List<String>? Day,
  @Default('') dynamic Days_Name,
  @Default('') dynamic Time_List
  }) = _DaySlot;
  static const fromJsonFactory = _$DaySlotFromJson;
  factory DaySlot.fromJson(Map<String, dynamic> json) =>
      _$DaySlotFromJson(json);
}
