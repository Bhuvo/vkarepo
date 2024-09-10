import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_response.freezed.dart';
part 'api_response.g.dart';

@freezed
class ApiResponse with _$ApiResponse {
  const factory ApiResponse({
    @JsonKey(name: 'ResponseMessage') String? message,
    @JsonKey(name: 'Message') dynamic? Rmessage,
    @JsonKey(name: 'Key') dynamic? Rkey,
    @JsonKey(name: 'ResponseCode') dynamic? code,
    @JsonKey(name: 'Responsecode') dynamic? Rcode,

    @JsonKey(name: 'R') dynamic? R,
    @Default(null) @JsonKey(name: 'Data') dynamic data,
  }) = _ApiResponse;
  static const fromJsonFactory = _$ApiResponseFromJson;
  factory ApiResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiResponseFromJson(json);
}
