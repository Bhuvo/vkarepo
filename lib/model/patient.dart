import 'package:freezed_annotation/freezed_annotation.dart';

part 'patient.freezed.dart';

part 'patient.g.dart';

@freezed
class Patient with _$Patient {
  const factory Patient({
    @JsonKey(name: 'Patient_Id') @Default(null) dynamic id,
    @JsonKey(name: 'User_id') @Default(null) dynamic userId,
    @JsonKey(name: 'Patient_Registration_Number') String? regNo,
    @JsonKey(name: 'First_Name') String? firstName,
    @JsonKey(name: 'RelationName') String? relationName,
    @JsonKey(name: 'Last_Name') String? lastName,
    @JsonKey(name: 'PatientName') String? patientName,
    @JsonKey(name: 'User_Name') String? userName,
    @JsonKey(name: 'DOB') String? dob,
    @JsonKey(name: 'Age') @Default(null) dynamic age,
    @JsonKey(name: 'Gender') String? gender,
    @JsonKey(name: 'Image') @Default(null) dynamic patientImage,
    @JsonKey(name: 'Phone_Number') String? phone,
    @JsonKey(name: 'FamilyMember_id') @Default(null) dynamic familyMemberId,
    @JsonKey(name: 'PrimaryAccount_No') int? primaryAccountNo,
    @JsonKey(name: 'PrimaryMobile') String? primaryMobile,
    @JsonKey(name: 'Primary_User_id') @Default(null) dynamic primaryUserId,
    @JsonKey(name: 'MobileNumber') String? mobile,
    @JsonKey(name: 'Watsapp_Number') String? whatsapp,
    @JsonKey(name: 'EMail_Id') String? email,
    @JsonKey(name: 'EmailID') String? emailId,
    @JsonKey(name: 'Time_in_Therapeutic_Ratio') String? ttr,
    @JsonKey(name: 'Password') String? password,
    @JsonKey(name: 'Doctor_Id') @Default(null) dynamic doctorId,
    @JsonKey(name: 'Traget_INR_From') String? inrFrom,
    @JsonKey(name: 'Traget_INR_To') String? inrTo,
    @JsonKey(name: 'Date') String? date,
    @JsonKey(name: 'Doctor_ActiveFlag') String? doctorActive,
    @JsonKey(name: 'Patient_ActiveFlag') String? patientActive,
    @JsonKey(name: 'PatientRegistration_list') String? patientRegistrationList,
  }) = _Patient;

  static const fromJsonFactory = _$PatientFromJson;

  factory Patient.fromJson(Map<String, dynamic> json) =>
      _$PatientFromJson(json);
}
