import 'package:freezed_annotation/freezed_annotation.dart';

part 'call_extend.freezed.dart';
part 'call_extend.g.dart';

@freezed
class CallExtendModel with _$CallExtendModel{
  const factory CallExtendModel({
   required String responseCode,
   required String responseMessage,

  }) = _CallExtendModel;
  static const fromJsonFactory = _$CallExtendModelFromJson;
  factory CallExtendModel.fromJson(Map<String, dynamic> json) =>
      _$CallExtendModelFromJson(json);
}








