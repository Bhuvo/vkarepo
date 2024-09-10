import 'package:freezed_annotation/freezed_annotation.dart';

part 'stream_time_updation.freezed.dart';
part 'stream_time_updation.g.dart';

@freezed
class StreamTimeUpdationModel with _$StreamTimeUpdationModel{
  const factory StreamTimeUpdationModel({
    required String responseCode,
    required String responseMessage,

  }) = _StreamTimeUpdationModel;
  static const fromJsonFactory = _$StreamTimeUpdationModelFromJson;
  factory StreamTimeUpdationModel.fromJson(Map<String, dynamic> json) =>
      _$StreamTimeUpdationModelFromJson(json);
}








