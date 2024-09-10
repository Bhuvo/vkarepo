import 'package:freezed_annotation/freezed_annotation.dart';


part 'vka_patient_inr_details.freezed.dart';
part 'vka_patient_inr_details.g.dart';

@freezed
class VKAPatientINRDetails with _$VKAPatientINRDetails {
  const factory VKAPatientINRDetails({

    int? inrDetailsId,
    String? doctorId,
    String? patientId,
    String? date,
    String? ptPatient,
    String? ptControl,
    String? inr,
    String? mon,
    String? tue,
    String? wed,
    String? thu,
    String? fri,
    String? sat,
    String? sun,
    String? targetInr,
    String? nextTest,
    String? diagnosis,
    String? drug,
    String? doctorActiveFlag,
    String? patientActiveFlag,
    String? activeFlag,
    String? insertDate,
    @JsonKey(name: 'Notes') @Default(null) dynamic notes,
    int? days,
    String? symbolName,
    dynamic inrDetailsList,
    dynamic patientRegistrationList,

  }) = _VKAPatientINRDetails;
  static const fromJsonFactory = _$VKAPatientINRDetailsFromJson;
  factory VKAPatientINRDetails.fromJson(Map<String, dynamic> json) =>
      _$VKAPatientINRDetailsFromJson(json);
}