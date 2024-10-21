import 'package:freezed_annotation/freezed_annotation.dart';

// part 'fetch_list_response.freezed.dart';
part 'fetch_list_response.g.dart';

@JsonSerializable()
class FetchListResponse {

  @JsonKey(name: 'ResponseMessage') String? message;
    @JsonKey(name: 'ResponseCode') @Default(null) dynamic code;
    @JsonKey(name: 'Data') @Default([]) dynamic data;
    @JsonKey(name: 'data') @Default([]) dynamic payload;


  FetchListResponse(this.message, this.code, this.data,
      this.payload);

  // factory FetchListResponse({
  //   @JsonKey(name: 'ResponseMessage') String? message,
  //   @JsonKey(name: 'ResponseCode') @Default(null) dynamic code,
  //   @JsonKey(name: 'Data') @Default([]) dynamic data,
  //   @JsonKey(name: 'data') @Default([]) dynamic payload,
  // })
static FetchListResponse fromJson(Map<String, dynamic> json) {
  return _$FetchListResponseFromJson(json);
}
  Map<String, dynamic> toJson() => _$FetchListResponseToJson(this);

}
