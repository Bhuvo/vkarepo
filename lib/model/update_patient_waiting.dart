import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_patient_waiting.freezed.dart';
part 'update_patient_waiting.g.dart';

@freezed
class UpdatePatientWaiting with _$UpdatePatientWaiting {
  const factory UpdatePatientWaiting({

   required int responseCode,
    required int waitingMinutes,
    required int queue,
    required int totalQueue,
    required String dayEndFlag,
    required String doctorOnline,

  }) = _UpdatePatientWaiting;
  static const fromJsonFactory = _$UpdatePatientWaitingFromJson;
  factory UpdatePatientWaiting.fromJson(Map<String, dynamic> json) =>
      _$UpdatePatientWaitingFromJson(json);
}








