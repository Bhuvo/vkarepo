import 'package:freezed_annotation/freezed_annotation.dart';
import 'time_list.dart';

part 'time_list_response.freezed.dart';
part 'time_list_response.g.dart';

@freezed
class TimeListResponse with _$TimeListResponse {
  const factory TimeListResponse({
    @JsonKey(name: 'TimeList') List<TimeList>? timeList
  }) = _TimeListResponse;
  static const fromJsonFactory = _$TimeListResponseFromJson;
  factory TimeListResponse.fromJson(Map<String, dynamic> json) =>
      _$TimeListResponseFromJson(json);
}