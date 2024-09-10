import 'package:freezed_annotation/freezed_annotation.dart';

part 'vka_patient_info.freezed.dart';
part 'vka_patient_info.g.dart';

@freezed
class VkaPatientInfo with _$VkaPatientInfo{
  const factory VkaPatientInfo({

    int? patientId,
    String? patientRegistrationNumber,
    String? firstName,
    String? lastName,
    String? dob,
    String? age,
    String? gender,
    String? phoneNumber,
    String? watsappNumber,
    String? eMailId,
    dynamic timeInTherapeuticRatio,
    String? password,
    String? doctorId,
    dynamic tragetInrFrom,
    dynamic tragetInrTo,
    dynamic date,
    dynamic doctorActiveFlag,
    dynamic patientActiveFlag,
    dynamic patientRegistrationList,

  }) = _VkaPatientInfo;
  static const fromJsonFactory = _$VkaPatientInfoFromJson;
  factory VkaPatientInfo.fromJson(Map<String, dynamic> json) =>
      _$VkaPatientInfoFromJson(json);
}








