import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:timesmedlite/model/intake_object.dart';

part 'view_records.freezed.dart';

part 'view_records.g.dart';

@freezed
class ViewRecords with _$ViewRecords {
  const factory ViewRecords(
      {@Default('') dynamic id,
      @Default('') dynamic Name,
      @Default('') dynamic Description,
      @Default('') dynamic Date,
      @Default('') dynamic Type}) = _ViewRecords;

  static const fromJsonFactory = _$ViewRecordsFromJson;

  factory ViewRecords.fromJson(Map<String, dynamic> json) =>
      _$ViewRecordsFromJson(json);
}
