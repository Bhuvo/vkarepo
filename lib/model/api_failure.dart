import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_failure.freezed.dart';
part 'api_failure.g.dart';

@freezed
class ApiFailure with _$ApiFailure {
  const factory ApiFailure({
    @JsonKey(name: 'ResponseMessage') String? message,
    @JsonKey(name: 'ResponseCode') String? code,
  }) = _ApiFailure;
  static const fromJsonFactory = _$ApiFailureFromJson;
  factory ApiFailure.fromJson(Map<String, dynamic> json) =>
      _$ApiFailureFromJson(json);
}
