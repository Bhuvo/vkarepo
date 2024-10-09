// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patient.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Patient _$PatientFromJson(Map<String, dynamic> json) {
  return _Patient.fromJson(json);
}

/// @nodoc
mixin _$Patient {
  @JsonKey(name: 'Patient_Id')
  dynamic get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'User_id')
  dynamic get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'Patient_Registration_Number')
  String? get regNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'First_Name')
  String? get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'RelationName')
  String? get relationName => throw _privateConstructorUsedError;
  @JsonKey(name: 'Last_Name')
  String? get lastName => throw _privateConstructorUsedError;
  @JsonKey(name: 'PatientName')
  String? get patientName => throw _privateConstructorUsedError;
  @JsonKey(name: 'User_Name')
  String? get userName => throw _privateConstructorUsedError;
  @JsonKey(name: 'DOB')
  String? get dob => throw _privateConstructorUsedError;
  @JsonKey(name: 'Age')
  dynamic get age => throw _privateConstructorUsedError;
  @JsonKey(name: 'Gender')
  String? get gender => throw _privateConstructorUsedError;
  @JsonKey(name: 'Image')
  dynamic get patientImage => throw _privateConstructorUsedError;
  @JsonKey(name: 'Phone_Number')
  String? get phone => throw _privateConstructorUsedError;
  @JsonKey(name: 'FamilyMember_id')
  dynamic get familyMemberId => throw _privateConstructorUsedError;
  @JsonKey(name: 'PrimaryAccount_No')
  int? get primaryAccountNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'PrimaryMobile')
  String? get primaryMobile => throw _privateConstructorUsedError;
  @JsonKey(name: 'Primary_User_id')
  dynamic get primaryUserId => throw _privateConstructorUsedError;
  @JsonKey(name: 'MobileNumber')
  String? get mobile => throw _privateConstructorUsedError;
  @JsonKey(name: 'Watsapp_Number')
  String? get whatsapp => throw _privateConstructorUsedError;
  @JsonKey(name: 'EMail_Id')
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'EmailID')
  String? get emailId => throw _privateConstructorUsedError;
  @JsonKey(name: 'Time_in_Therapeutic_Ratio')
  String? get ttr => throw _privateConstructorUsedError;
  @JsonKey(name: 'Password')
  String? get password => throw _privateConstructorUsedError;
  @JsonKey(name: 'Doctor_Id')
  dynamic get doctorId => throw _privateConstructorUsedError;
  @JsonKey(name: 'Traget_INR_From')
  String? get inrFrom => throw _privateConstructorUsedError;
  @JsonKey(name: 'Traget_INR_To')
  String? get inrTo => throw _privateConstructorUsedError;
  @JsonKey(name: 'Date')
  String? get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'Doctor_ActiveFlag')
  String? get doctorActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'Patient_ActiveFlag')
  String? get patientActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'PatientRegistration_list')
  String? get patientRegistrationList => throw _privateConstructorUsedError;

  /// Serializes this Patient to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Patient
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PatientCopyWith<Patient> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatientCopyWith<$Res> {
  factory $PatientCopyWith(Patient value, $Res Function(Patient) then) =
      _$PatientCopyWithImpl<$Res, Patient>;
  @useResult
  $Res call(
      {@JsonKey(name: 'Patient_Id') dynamic id,
      @JsonKey(name: 'User_id') dynamic userId,
      @JsonKey(name: 'Patient_Registration_Number') String? regNo,
      @JsonKey(name: 'First_Name') String? firstName,
      @JsonKey(name: 'RelationName') String? relationName,
      @JsonKey(name: 'Last_Name') String? lastName,
      @JsonKey(name: 'PatientName') String? patientName,
      @JsonKey(name: 'User_Name') String? userName,
      @JsonKey(name: 'DOB') String? dob,
      @JsonKey(name: 'Age') dynamic age,
      @JsonKey(name: 'Gender') String? gender,
      @JsonKey(name: 'Image') dynamic patientImage,
      @JsonKey(name: 'Phone_Number') String? phone,
      @JsonKey(name: 'FamilyMember_id') dynamic familyMemberId,
      @JsonKey(name: 'PrimaryAccount_No') int? primaryAccountNo,
      @JsonKey(name: 'PrimaryMobile') String? primaryMobile,
      @JsonKey(name: 'Primary_User_id') dynamic primaryUserId,
      @JsonKey(name: 'MobileNumber') String? mobile,
      @JsonKey(name: 'Watsapp_Number') String? whatsapp,
      @JsonKey(name: 'EMail_Id') String? email,
      @JsonKey(name: 'EmailID') String? emailId,
      @JsonKey(name: 'Time_in_Therapeutic_Ratio') String? ttr,
      @JsonKey(name: 'Password') String? password,
      @JsonKey(name: 'Doctor_Id') dynamic doctorId,
      @JsonKey(name: 'Traget_INR_From') String? inrFrom,
      @JsonKey(name: 'Traget_INR_To') String? inrTo,
      @JsonKey(name: 'Date') String? date,
      @JsonKey(name: 'Doctor_ActiveFlag') String? doctorActive,
      @JsonKey(name: 'Patient_ActiveFlag') String? patientActive,
      @JsonKey(name: 'PatientRegistration_list')
      String? patientRegistrationList});
}

/// @nodoc
class _$PatientCopyWithImpl<$Res, $Val extends Patient>
    implements $PatientCopyWith<$Res> {
  _$PatientCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Patient
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? regNo = freezed,
    Object? firstName = freezed,
    Object? relationName = freezed,
    Object? lastName = freezed,
    Object? patientName = freezed,
    Object? userName = freezed,
    Object? dob = freezed,
    Object? age = freezed,
    Object? gender = freezed,
    Object? patientImage = freezed,
    Object? phone = freezed,
    Object? familyMemberId = freezed,
    Object? primaryAccountNo = freezed,
    Object? primaryMobile = freezed,
    Object? primaryUserId = freezed,
    Object? mobile = freezed,
    Object? whatsapp = freezed,
    Object? email = freezed,
    Object? emailId = freezed,
    Object? ttr = freezed,
    Object? password = freezed,
    Object? doctorId = freezed,
    Object? inrFrom = freezed,
    Object? inrTo = freezed,
    Object? date = freezed,
    Object? doctorActive = freezed,
    Object? patientActive = freezed,
    Object? patientRegistrationList = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as dynamic,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      regNo: freezed == regNo
          ? _value.regNo
          : regNo // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      relationName: freezed == relationName
          ? _value.relationName
          : relationName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      patientName: freezed == patientName
          ? _value.patientName
          : patientName // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      dob: freezed == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as String?,
      age: freezed == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as dynamic,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      patientImage: freezed == patientImage
          ? _value.patientImage
          : patientImage // ignore: cast_nullable_to_non_nullable
              as dynamic,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      familyMemberId: freezed == familyMemberId
          ? _value.familyMemberId
          : familyMemberId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      primaryAccountNo: freezed == primaryAccountNo
          ? _value.primaryAccountNo
          : primaryAccountNo // ignore: cast_nullable_to_non_nullable
              as int?,
      primaryMobile: freezed == primaryMobile
          ? _value.primaryMobile
          : primaryMobile // ignore: cast_nullable_to_non_nullable
              as String?,
      primaryUserId: freezed == primaryUserId
          ? _value.primaryUserId
          : primaryUserId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      mobile: freezed == mobile
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as String?,
      whatsapp: freezed == whatsapp
          ? _value.whatsapp
          : whatsapp // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      emailId: freezed == emailId
          ? _value.emailId
          : emailId // ignore: cast_nullable_to_non_nullable
              as String?,
      ttr: freezed == ttr
          ? _value.ttr
          : ttr // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      doctorId: freezed == doctorId
          ? _value.doctorId
          : doctorId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      inrFrom: freezed == inrFrom
          ? _value.inrFrom
          : inrFrom // ignore: cast_nullable_to_non_nullable
              as String?,
      inrTo: freezed == inrTo
          ? _value.inrTo
          : inrTo // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      doctorActive: freezed == doctorActive
          ? _value.doctorActive
          : doctorActive // ignore: cast_nullable_to_non_nullable
              as String?,
      patientActive: freezed == patientActive
          ? _value.patientActive
          : patientActive // ignore: cast_nullable_to_non_nullable
              as String?,
      patientRegistrationList: freezed == patientRegistrationList
          ? _value.patientRegistrationList
          : patientRegistrationList // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PatientImplCopyWith<$Res> implements $PatientCopyWith<$Res> {
  factory _$$PatientImplCopyWith(
          _$PatientImpl value, $Res Function(_$PatientImpl) then) =
      __$$PatientImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'Patient_Id') dynamic id,
      @JsonKey(name: 'User_id') dynamic userId,
      @JsonKey(name: 'Patient_Registration_Number') String? regNo,
      @JsonKey(name: 'First_Name') String? firstName,
      @JsonKey(name: 'RelationName') String? relationName,
      @JsonKey(name: 'Last_Name') String? lastName,
      @JsonKey(name: 'PatientName') String? patientName,
      @JsonKey(name: 'User_Name') String? userName,
      @JsonKey(name: 'DOB') String? dob,
      @JsonKey(name: 'Age') dynamic age,
      @JsonKey(name: 'Gender') String? gender,
      @JsonKey(name: 'Image') dynamic patientImage,
      @JsonKey(name: 'Phone_Number') String? phone,
      @JsonKey(name: 'FamilyMember_id') dynamic familyMemberId,
      @JsonKey(name: 'PrimaryAccount_No') int? primaryAccountNo,
      @JsonKey(name: 'PrimaryMobile') String? primaryMobile,
      @JsonKey(name: 'Primary_User_id') dynamic primaryUserId,
      @JsonKey(name: 'MobileNumber') String? mobile,
      @JsonKey(name: 'Watsapp_Number') String? whatsapp,
      @JsonKey(name: 'EMail_Id') String? email,
      @JsonKey(name: 'EmailID') String? emailId,
      @JsonKey(name: 'Time_in_Therapeutic_Ratio') String? ttr,
      @JsonKey(name: 'Password') String? password,
      @JsonKey(name: 'Doctor_Id') dynamic doctorId,
      @JsonKey(name: 'Traget_INR_From') String? inrFrom,
      @JsonKey(name: 'Traget_INR_To') String? inrTo,
      @JsonKey(name: 'Date') String? date,
      @JsonKey(name: 'Doctor_ActiveFlag') String? doctorActive,
      @JsonKey(name: 'Patient_ActiveFlag') String? patientActive,
      @JsonKey(name: 'PatientRegistration_list')
      String? patientRegistrationList});
}

/// @nodoc
class __$$PatientImplCopyWithImpl<$Res>
    extends _$PatientCopyWithImpl<$Res, _$PatientImpl>
    implements _$$PatientImplCopyWith<$Res> {
  __$$PatientImplCopyWithImpl(
      _$PatientImpl _value, $Res Function(_$PatientImpl) _then)
      : super(_value, _then);

  /// Create a copy of Patient
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? regNo = freezed,
    Object? firstName = freezed,
    Object? relationName = freezed,
    Object? lastName = freezed,
    Object? patientName = freezed,
    Object? userName = freezed,
    Object? dob = freezed,
    Object? age = freezed,
    Object? gender = freezed,
    Object? patientImage = freezed,
    Object? phone = freezed,
    Object? familyMemberId = freezed,
    Object? primaryAccountNo = freezed,
    Object? primaryMobile = freezed,
    Object? primaryUserId = freezed,
    Object? mobile = freezed,
    Object? whatsapp = freezed,
    Object? email = freezed,
    Object? emailId = freezed,
    Object? ttr = freezed,
    Object? password = freezed,
    Object? doctorId = freezed,
    Object? inrFrom = freezed,
    Object? inrTo = freezed,
    Object? date = freezed,
    Object? doctorActive = freezed,
    Object? patientActive = freezed,
    Object? patientRegistrationList = freezed,
  }) {
    return _then(_$PatientImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as dynamic,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      regNo: freezed == regNo
          ? _value.regNo
          : regNo // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      relationName: freezed == relationName
          ? _value.relationName
          : relationName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      patientName: freezed == patientName
          ? _value.patientName
          : patientName // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      dob: freezed == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as String?,
      age: freezed == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as dynamic,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      patientImage: freezed == patientImage
          ? _value.patientImage
          : patientImage // ignore: cast_nullable_to_non_nullable
              as dynamic,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      familyMemberId: freezed == familyMemberId
          ? _value.familyMemberId
          : familyMemberId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      primaryAccountNo: freezed == primaryAccountNo
          ? _value.primaryAccountNo
          : primaryAccountNo // ignore: cast_nullable_to_non_nullable
              as int?,
      primaryMobile: freezed == primaryMobile
          ? _value.primaryMobile
          : primaryMobile // ignore: cast_nullable_to_non_nullable
              as String?,
      primaryUserId: freezed == primaryUserId
          ? _value.primaryUserId
          : primaryUserId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      mobile: freezed == mobile
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as String?,
      whatsapp: freezed == whatsapp
          ? _value.whatsapp
          : whatsapp // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      emailId: freezed == emailId
          ? _value.emailId
          : emailId // ignore: cast_nullable_to_non_nullable
              as String?,
      ttr: freezed == ttr
          ? _value.ttr
          : ttr // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      doctorId: freezed == doctorId
          ? _value.doctorId
          : doctorId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      inrFrom: freezed == inrFrom
          ? _value.inrFrom
          : inrFrom // ignore: cast_nullable_to_non_nullable
              as String?,
      inrTo: freezed == inrTo
          ? _value.inrTo
          : inrTo // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      doctorActive: freezed == doctorActive
          ? _value.doctorActive
          : doctorActive // ignore: cast_nullable_to_non_nullable
              as String?,
      patientActive: freezed == patientActive
          ? _value.patientActive
          : patientActive // ignore: cast_nullable_to_non_nullable
              as String?,
      patientRegistrationList: freezed == patientRegistrationList
          ? _value.patientRegistrationList
          : patientRegistrationList // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PatientImpl implements _Patient {
  const _$PatientImpl(
      {@JsonKey(name: 'Patient_Id') this.id = null,
      @JsonKey(name: 'User_id') this.userId = null,
      @JsonKey(name: 'Patient_Registration_Number') this.regNo,
      @JsonKey(name: 'First_Name') this.firstName,
      @JsonKey(name: 'RelationName') this.relationName,
      @JsonKey(name: 'Last_Name') this.lastName,
      @JsonKey(name: 'PatientName') this.patientName,
      @JsonKey(name: 'User_Name') this.userName,
      @JsonKey(name: 'DOB') this.dob,
      @JsonKey(name: 'Age') this.age = null,
      @JsonKey(name: 'Gender') this.gender,
      @JsonKey(name: 'Image') this.patientImage = null,
      @JsonKey(name: 'Phone_Number') this.phone,
      @JsonKey(name: 'FamilyMember_id') this.familyMemberId = null,
      @JsonKey(name: 'PrimaryAccount_No') this.primaryAccountNo,
      @JsonKey(name: 'PrimaryMobile') this.primaryMobile,
      @JsonKey(name: 'Primary_User_id') this.primaryUserId = null,
      @JsonKey(name: 'MobileNumber') this.mobile,
      @JsonKey(name: 'Watsapp_Number') this.whatsapp,
      @JsonKey(name: 'EMail_Id') this.email,
      @JsonKey(name: 'EmailID') this.emailId,
      @JsonKey(name: 'Time_in_Therapeutic_Ratio') this.ttr,
      @JsonKey(name: 'Password') this.password,
      @JsonKey(name: 'Doctor_Id') this.doctorId = null,
      @JsonKey(name: 'Traget_INR_From') this.inrFrom,
      @JsonKey(name: 'Traget_INR_To') this.inrTo,
      @JsonKey(name: 'Date') this.date,
      @JsonKey(name: 'Doctor_ActiveFlag') this.doctorActive,
      @JsonKey(name: 'Patient_ActiveFlag') this.patientActive,
      @JsonKey(name: 'PatientRegistration_list') this.patientRegistrationList});

  factory _$PatientImpl.fromJson(Map<String, dynamic> json) =>
      _$$PatientImplFromJson(json);

  @override
  @JsonKey(name: 'Patient_Id')
  final dynamic id;
  @override
  @JsonKey(name: 'User_id')
  final dynamic userId;
  @override
  @JsonKey(name: 'Patient_Registration_Number')
  final String? regNo;
  @override
  @JsonKey(name: 'First_Name')
  final String? firstName;
  @override
  @JsonKey(name: 'RelationName')
  final String? relationName;
  @override
  @JsonKey(name: 'Last_Name')
  final String? lastName;
  @override
  @JsonKey(name: 'PatientName')
  final String? patientName;
  @override
  @JsonKey(name: 'User_Name')
  final String? userName;
  @override
  @JsonKey(name: 'DOB')
  final String? dob;
  @override
  @JsonKey(name: 'Age')
  final dynamic age;
  @override
  @JsonKey(name: 'Gender')
  final String? gender;
  @override
  @JsonKey(name: 'Image')
  final dynamic patientImage;
  @override
  @JsonKey(name: 'Phone_Number')
  final String? phone;
  @override
  @JsonKey(name: 'FamilyMember_id')
  final dynamic familyMemberId;
  @override
  @JsonKey(name: 'PrimaryAccount_No')
  final int? primaryAccountNo;
  @override
  @JsonKey(name: 'PrimaryMobile')
  final String? primaryMobile;
  @override
  @JsonKey(name: 'Primary_User_id')
  final dynamic primaryUserId;
  @override
  @JsonKey(name: 'MobileNumber')
  final String? mobile;
  @override
  @JsonKey(name: 'Watsapp_Number')
  final String? whatsapp;
  @override
  @JsonKey(name: 'EMail_Id')
  final String? email;
  @override
  @JsonKey(name: 'EmailID')
  final String? emailId;
  @override
  @JsonKey(name: 'Time_in_Therapeutic_Ratio')
  final String? ttr;
  @override
  @JsonKey(name: 'Password')
  final String? password;
  @override
  @JsonKey(name: 'Doctor_Id')
  final dynamic doctorId;
  @override
  @JsonKey(name: 'Traget_INR_From')
  final String? inrFrom;
  @override
  @JsonKey(name: 'Traget_INR_To')
  final String? inrTo;
  @override
  @JsonKey(name: 'Date')
  final String? date;
  @override
  @JsonKey(name: 'Doctor_ActiveFlag')
  final String? doctorActive;
  @override
  @JsonKey(name: 'Patient_ActiveFlag')
  final String? patientActive;
  @override
  @JsonKey(name: 'PatientRegistration_list')
  final String? patientRegistrationList;

  @override
  String toString() {
    return 'Patient(id: $id, userId: $userId, regNo: $regNo, firstName: $firstName, relationName: $relationName, lastName: $lastName, patientName: $patientName, userName: $userName, dob: $dob, age: $age, gender: $gender, patientImage: $patientImage, phone: $phone, familyMemberId: $familyMemberId, primaryAccountNo: $primaryAccountNo, primaryMobile: $primaryMobile, primaryUserId: $primaryUserId, mobile: $mobile, whatsapp: $whatsapp, email: $email, emailId: $emailId, ttr: $ttr, password: $password, doctorId: $doctorId, inrFrom: $inrFrom, inrTo: $inrTo, date: $date, doctorActive: $doctorActive, patientActive: $patientActive, patientRegistrationList: $patientRegistrationList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PatientImpl &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            (identical(other.regNo, regNo) || other.regNo == regNo) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.relationName, relationName) ||
                other.relationName == relationName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.patientName, patientName) ||
                other.patientName == patientName) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.dob, dob) || other.dob == dob) &&
            const DeepCollectionEquality().equals(other.age, age) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            const DeepCollectionEquality()
                .equals(other.patientImage, patientImage) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            const DeepCollectionEquality()
                .equals(other.familyMemberId, familyMemberId) &&
            (identical(other.primaryAccountNo, primaryAccountNo) ||
                other.primaryAccountNo == primaryAccountNo) &&
            (identical(other.primaryMobile, primaryMobile) ||
                other.primaryMobile == primaryMobile) &&
            const DeepCollectionEquality()
                .equals(other.primaryUserId, primaryUserId) &&
            (identical(other.mobile, mobile) || other.mobile == mobile) &&
            (identical(other.whatsapp, whatsapp) ||
                other.whatsapp == whatsapp) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.emailId, emailId) || other.emailId == emailId) &&
            (identical(other.ttr, ttr) || other.ttr == ttr) &&
            (identical(other.password, password) ||
                other.password == password) &&
            const DeepCollectionEquality().equals(other.doctorId, doctorId) &&
            (identical(other.inrFrom, inrFrom) || other.inrFrom == inrFrom) &&
            (identical(other.inrTo, inrTo) || other.inrTo == inrTo) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.doctorActive, doctorActive) ||
                other.doctorActive == doctorActive) &&
            (identical(other.patientActive, patientActive) ||
                other.patientActive == patientActive) &&
            (identical(
                    other.patientRegistrationList, patientRegistrationList) ||
                other.patientRegistrationList == patientRegistrationList));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        const DeepCollectionEquality().hash(id),
        const DeepCollectionEquality().hash(userId),
        regNo,
        firstName,
        relationName,
        lastName,
        patientName,
        userName,
        dob,
        const DeepCollectionEquality().hash(age),
        gender,
        const DeepCollectionEquality().hash(patientImage),
        phone,
        const DeepCollectionEquality().hash(familyMemberId),
        primaryAccountNo,
        primaryMobile,
        const DeepCollectionEquality().hash(primaryUserId),
        mobile,
        whatsapp,
        email,
        emailId,
        ttr,
        password,
        const DeepCollectionEquality().hash(doctorId),
        inrFrom,
        inrTo,
        date,
        doctorActive,
        patientActive,
        patientRegistrationList
      ]);

  /// Create a copy of Patient
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PatientImplCopyWith<_$PatientImpl> get copyWith =>
      __$$PatientImplCopyWithImpl<_$PatientImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PatientImplToJson(
      this,
    );
  }
}

abstract class _Patient implements Patient {
  const factory _Patient(
      {@JsonKey(name: 'Patient_Id') final dynamic id,
      @JsonKey(name: 'User_id') final dynamic userId,
      @JsonKey(name: 'Patient_Registration_Number') final String? regNo,
      @JsonKey(name: 'First_Name') final String? firstName,
      @JsonKey(name: 'RelationName') final String? relationName,
      @JsonKey(name: 'Last_Name') final String? lastName,
      @JsonKey(name: 'PatientName') final String? patientName,
      @JsonKey(name: 'User_Name') final String? userName,
      @JsonKey(name: 'DOB') final String? dob,
      @JsonKey(name: 'Age') final dynamic age,
      @JsonKey(name: 'Gender') final String? gender,
      @JsonKey(name: 'Image') final dynamic patientImage,
      @JsonKey(name: 'Phone_Number') final String? phone,
      @JsonKey(name: 'FamilyMember_id') final dynamic familyMemberId,
      @JsonKey(name: 'PrimaryAccount_No') final int? primaryAccountNo,
      @JsonKey(name: 'PrimaryMobile') final String? primaryMobile,
      @JsonKey(name: 'Primary_User_id') final dynamic primaryUserId,
      @JsonKey(name: 'MobileNumber') final String? mobile,
      @JsonKey(name: 'Watsapp_Number') final String? whatsapp,
      @JsonKey(name: 'EMail_Id') final String? email,
      @JsonKey(name: 'EmailID') final String? emailId,
      @JsonKey(name: 'Time_in_Therapeutic_Ratio') final String? ttr,
      @JsonKey(name: 'Password') final String? password,
      @JsonKey(name: 'Doctor_Id') final dynamic doctorId,
      @JsonKey(name: 'Traget_INR_From') final String? inrFrom,
      @JsonKey(name: 'Traget_INR_To') final String? inrTo,
      @JsonKey(name: 'Date') final String? date,
      @JsonKey(name: 'Doctor_ActiveFlag') final String? doctorActive,
      @JsonKey(name: 'Patient_ActiveFlag') final String? patientActive,
      @JsonKey(name: 'PatientRegistration_list')
      final String? patientRegistrationList}) = _$PatientImpl;

  factory _Patient.fromJson(Map<String, dynamic> json) = _$PatientImpl.fromJson;

  @override
  @JsonKey(name: 'Patient_Id')
  dynamic get id;
  @override
  @JsonKey(name: 'User_id')
  dynamic get userId;
  @override
  @JsonKey(name: 'Patient_Registration_Number')
  String? get regNo;
  @override
  @JsonKey(name: 'First_Name')
  String? get firstName;
  @override
  @JsonKey(name: 'RelationName')
  String? get relationName;
  @override
  @JsonKey(name: 'Last_Name')
  String? get lastName;
  @override
  @JsonKey(name: 'PatientName')
  String? get patientName;
  @override
  @JsonKey(name: 'User_Name')
  String? get userName;
  @override
  @JsonKey(name: 'DOB')
  String? get dob;
  @override
  @JsonKey(name: 'Age')
  dynamic get age;
  @override
  @JsonKey(name: 'Gender')
  String? get gender;
  @override
  @JsonKey(name: 'Image')
  dynamic get patientImage;
  @override
  @JsonKey(name: 'Phone_Number')
  String? get phone;
  @override
  @JsonKey(name: 'FamilyMember_id')
  dynamic get familyMemberId;
  @override
  @JsonKey(name: 'PrimaryAccount_No')
  int? get primaryAccountNo;
  @override
  @JsonKey(name: 'PrimaryMobile')
  String? get primaryMobile;
  @override
  @JsonKey(name: 'Primary_User_id')
  dynamic get primaryUserId;
  @override
  @JsonKey(name: 'MobileNumber')
  String? get mobile;
  @override
  @JsonKey(name: 'Watsapp_Number')
  String? get whatsapp;
  @override
  @JsonKey(name: 'EMail_Id')
  String? get email;
  @override
  @JsonKey(name: 'EmailID')
  String? get emailId;
  @override
  @JsonKey(name: 'Time_in_Therapeutic_Ratio')
  String? get ttr;
  @override
  @JsonKey(name: 'Password')
  String? get password;
  @override
  @JsonKey(name: 'Doctor_Id')
  dynamic get doctorId;
  @override
  @JsonKey(name: 'Traget_INR_From')
  String? get inrFrom;
  @override
  @JsonKey(name: 'Traget_INR_To')
  String? get inrTo;
  @override
  @JsonKey(name: 'Date')
  String? get date;
  @override
  @JsonKey(name: 'Doctor_ActiveFlag')
  String? get doctorActive;
  @override
  @JsonKey(name: 'Patient_ActiveFlag')
  String? get patientActive;
  @override
  @JsonKey(name: 'PatientRegistration_list')
  String? get patientRegistrationList;

  /// Create a copy of Patient
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PatientImplCopyWith<_$PatientImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
