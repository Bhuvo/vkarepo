import 'package:freezed_annotation/freezed_annotation.dart';

part 'inr_patient.freezed.dart';
part 'inr_patient.g.dart';

@freezed
class InrPatient with _$InrPatient {
  const factory InrPatient({
    num? Patient_Id,
    String? Patient_Registration_Number,
    String? First_Name,
    String? Last_Name,
    String? DOB,
    String? Age,
    String? Gender,
    String? Phone_Number,
    String? Watsapp_Number,
    String? EMail_Id,
    @Default(null) dynamic Time_in_Therapeutic_Ratio,
    String? Password,
    String? Doctor_Id,
    String? Traget_INR_From,
    String? Traget_INR_To,
    @Default(null) dynamic Date,
    @Default(null) dynamic Doctor_ActiveFlag,
    @Default(null) dynamic Patient_ActiveFlag,
    @Default(null) dynamic PatientRegistration_list
  }) = _InrPatient;
  static const fromJsonFactory = _$InrPatientFromJson;
  factory InrPatient.fromJson(Map<String, dynamic> json) =>
      _$InrPatientFromJson(json);
}

// {
// "Patient_Id": 229079,
// "Patient_Registration_Number": "123456",
// "First_Name": "Vignesh",
// "Last_Name": "Anbu",
// "DOB": "2/6/1992 12:00:00 AM",
// "Age": "29",
// "Gender": "Male",
// "Phone_Number": "8528528520",
// "Watsapp_Number": "7417417410",
// "EMail_Id": "dskd@gmail.com",
// "Time_in_Therapeutic_Ratio": null,
// "Password": "123",
// "Doctor_Id": "38371",
// "Traget_INR_From": "2.8",
// "Traget_INR_To": "3.2",
// "Date": null,
// "Doctor_ActiveFlag": null,
// "Patient_ActiveFlag": null,
// "PatientRegistration_list": null
// }