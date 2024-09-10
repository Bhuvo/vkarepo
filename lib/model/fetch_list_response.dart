import 'package:freezed_annotation/freezed_annotation.dart';

part 'fetch_list_response.freezed.dart';
part 'fetch_list_response.g.dart';

@freezed
class FetchListResponse with _$FetchListResponse {
  const factory FetchListResponse({
    @JsonKey(name: 'ResponseMessage') String? message,
    @JsonKey(name: 'ResponseCode') @Default(null) dynamic code,
    @JsonKey(name: 'Data') @Default([]) dynamic data,
    @JsonKey(name: 'data') @Default([]) dynamic payload,
  }) = _FetchListResponse;
  static const fromJsonFactory = _$FetchListResponseFromJson;
  factory FetchListResponse.fromJson(Map<String, dynamic> json) =>
      _$FetchListResponseFromJson(json);
}
