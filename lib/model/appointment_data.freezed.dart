// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'appointment_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AppointmentData _$AppointmentDataFromJson(Map<String, dynamic> json) {
  return _AppointmentData.fromJson(json);
}

/// @nodoc
mixin _$AppointmentData {
  @JsonKey(name: 'Type')
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'FreeReview')
  int? get freeReview => throw _privateConstructorUsedError;
  @JsonKey(name: 'Appointment_id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'Appointment_Date')
  String? get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'Appointment_Time')
  String? get time => throw _privateConstructorUsedError;
  @JsonKey(name: 'Doctor_id')
  int? get doctorId => throw _privateConstructorUsedError;
  @JsonKey(name: 'Doctor_Name')
  String? get doctorName => throw _privateConstructorUsedError;
  @JsonKey(name: 'DoctorCategory_Name')
  String? get doctorCategory => throw _privateConstructorUsedError;
  @JsonKey(name: 'Doctor_Image')
  String? get doctorImage => throw _privateConstructorUsedError;
  @JsonKey(name: 'City_Name')
  String? get cityName => throw _privateConstructorUsedError;
  @JsonKey(name: 'InstantURL')
  String? get instantURL => throw _privateConstructorUsedError;
  @JsonKey(name: 'ScheduleURL')
  String? get scheduleURL => throw _privateConstructorUsedError;
  @JsonKey(name: 'eclinic_Flag')
  dynamic get eClinicFlag => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppointmentDataCopyWith<AppointmentData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppointmentDataCopyWith<$Res> {
  factory $AppointmentDataCopyWith(
          AppointmentData value, $Res Function(AppointmentData) then) =
      _$AppointmentDataCopyWithImpl<$Res, AppointmentData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'Type') String? type,
      @JsonKey(name: 'FreeReview') int? freeReview,
      @JsonKey(name: 'Appointment_id') int? id,
      @JsonKey(name: 'Appointment_Date') String? date,
      @JsonKey(name: 'Appointment_Time') String? time,
      @JsonKey(name: 'Doctor_id') int? doctorId,
      @JsonKey(name: 'Doctor_Name') String? doctorName,
      @JsonKey(name: 'DoctorCategory_Name') String? doctorCategory,
      @JsonKey(name: 'Doctor_Image') String? doctorImage,
      @JsonKey(name: 'City_Name') String? cityName,
      @JsonKey(name: 'InstantURL') String? instantURL,
      @JsonKey(name: 'ScheduleURL') String? scheduleURL,
      @JsonKey(name: 'eclinic_Flag') dynamic eClinicFlag});
}

/// @nodoc
class _$AppointmentDataCopyWithImpl<$Res, $Val extends AppointmentData>
    implements $AppointmentDataCopyWith<$Res> {
  _$AppointmentDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? freeReview = freezed,
    Object? id = freezed,
    Object? date = freezed,
    Object? time = freezed,
    Object? doctorId = freezed,
    Object? doctorName = freezed,
    Object? doctorCategory = freezed,
    Object? doctorImage = freezed,
    Object? cityName = freezed,
    Object? instantURL = freezed,
    Object? scheduleURL = freezed,
    Object? eClinicFlag = freezed,
  }) {
    return _then(_value.copyWith(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      freeReview: freezed == freeReview
          ? _value.freeReview
          : freeReview // ignore: cast_nullable_to_non_nullable
              as int?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
      doctorId: freezed == doctorId
          ? _value.doctorId
          : doctorId // ignore: cast_nullable_to_non_nullable
              as int?,
      doctorName: freezed == doctorName
          ? _value.doctorName
          : doctorName // ignore: cast_nullable_to_non_nullable
              as String?,
      doctorCategory: freezed == doctorCategory
          ? _value.doctorCategory
          : doctorCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      doctorImage: freezed == doctorImage
          ? _value.doctorImage
          : doctorImage // ignore: cast_nullable_to_non_nullable
              as String?,
      cityName: freezed == cityName
          ? _value.cityName
          : cityName // ignore: cast_nullable_to_non_nullable
              as String?,
      instantURL: freezed == instantURL
          ? _value.instantURL
          : instantURL // ignore: cast_nullable_to_non_nullable
              as String?,
      scheduleURL: freezed == scheduleURL
          ? _value.scheduleURL
          : scheduleURL // ignore: cast_nullable_to_non_nullable
              as String?,
      eClinicFlag: freezed == eClinicFlag
          ? _value.eClinicFlag
          : eClinicFlag // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppointmentDataImplCopyWith<$Res>
    implements $AppointmentDataCopyWith<$Res> {
  factory _$$AppointmentDataImplCopyWith(_$AppointmentDataImpl value,
          $Res Function(_$AppointmentDataImpl) then) =
      __$$AppointmentDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'Type') String? type,
      @JsonKey(name: 'FreeReview') int? freeReview,
      @JsonKey(name: 'Appointment_id') int? id,
      @JsonKey(name: 'Appointment_Date') String? date,
      @JsonKey(name: 'Appointment_Time') String? time,
      @JsonKey(name: 'Doctor_id') int? doctorId,
      @JsonKey(name: 'Doctor_Name') String? doctorName,
      @JsonKey(name: 'DoctorCategory_Name') String? doctorCategory,
      @JsonKey(name: 'Doctor_Image') String? doctorImage,
      @JsonKey(name: 'City_Name') String? cityName,
      @JsonKey(name: 'InstantURL') String? instantURL,
      @JsonKey(name: 'ScheduleURL') String? scheduleURL,
      @JsonKey(name: 'eclinic_Flag') dynamic eClinicFlag});
}

/// @nodoc
class __$$AppointmentDataImplCopyWithImpl<$Res>
    extends _$AppointmentDataCopyWithImpl<$Res, _$AppointmentDataImpl>
    implements _$$AppointmentDataImplCopyWith<$Res> {
  __$$AppointmentDataImplCopyWithImpl(
      _$AppointmentDataImpl _value, $Res Function(_$AppointmentDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? freeReview = freezed,
    Object? id = freezed,
    Object? date = freezed,
    Object? time = freezed,
    Object? doctorId = freezed,
    Object? doctorName = freezed,
    Object? doctorCategory = freezed,
    Object? doctorImage = freezed,
    Object? cityName = freezed,
    Object? instantURL = freezed,
    Object? scheduleURL = freezed,
    Object? eClinicFlag = freezed,
  }) {
    return _then(_$AppointmentDataImpl(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      freeReview: freezed == freeReview
          ? _value.freeReview
          : freeReview // ignore: cast_nullable_to_non_nullable
              as int?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
      doctorId: freezed == doctorId
          ? _value.doctorId
          : doctorId // ignore: cast_nullable_to_non_nullable
              as int?,
      doctorName: freezed == doctorName
          ? _value.doctorName
          : doctorName // ignore: cast_nullable_to_non_nullable
              as String?,
      doctorCategory: freezed == doctorCategory
          ? _value.doctorCategory
          : doctorCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      doctorImage: freezed == doctorImage
          ? _value.doctorImage
          : doctorImage // ignore: cast_nullable_to_non_nullable
              as String?,
      cityName: freezed == cityName
          ? _value.cityName
          : cityName // ignore: cast_nullable_to_non_nullable
              as String?,
      instantURL: freezed == instantURL
          ? _value.instantURL
          : instantURL // ignore: cast_nullable_to_non_nullable
              as String?,
      scheduleURL: freezed == scheduleURL
          ? _value.scheduleURL
          : scheduleURL // ignore: cast_nullable_to_non_nullable
              as String?,
      eClinicFlag: freezed == eClinicFlag
          ? _value.eClinicFlag
          : eClinicFlag // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppointmentDataImpl implements _AppointmentData {
  const _$AppointmentDataImpl(
      {@JsonKey(name: 'Type') this.type,
      @JsonKey(name: 'FreeReview') this.freeReview,
      @JsonKey(name: 'Appointment_id') this.id,
      @JsonKey(name: 'Appointment_Date') this.date,
      @JsonKey(name: 'Appointment_Time') this.time,
      @JsonKey(name: 'Doctor_id') this.doctorId,
      @JsonKey(name: 'Doctor_Name') this.doctorName,
      @JsonKey(name: 'DoctorCategory_Name') this.doctorCategory,
      @JsonKey(name: 'Doctor_Image') this.doctorImage,
      @JsonKey(name: 'City_Name') this.cityName,
      @JsonKey(name: 'InstantURL') this.instantURL,
      @JsonKey(name: 'ScheduleURL') this.scheduleURL,
      @JsonKey(name: 'eclinic_Flag') this.eClinicFlag = null});

  factory _$AppointmentDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppointmentDataImplFromJson(json);

  @override
  @JsonKey(name: 'Type')
  final String? type;
  @override
  @JsonKey(name: 'FreeReview')
  final int? freeReview;
  @override
  @JsonKey(name: 'Appointment_id')
  final int? id;
  @override
  @JsonKey(name: 'Appointment_Date')
  final String? date;
  @override
  @JsonKey(name: 'Appointment_Time')
  final String? time;
  @override
  @JsonKey(name: 'Doctor_id')
  final int? doctorId;
  @override
  @JsonKey(name: 'Doctor_Name')
  final String? doctorName;
  @override
  @JsonKey(name: 'DoctorCategory_Name')
  final String? doctorCategory;
  @override
  @JsonKey(name: 'Doctor_Image')
  final String? doctorImage;
  @override
  @JsonKey(name: 'City_Name')
  final String? cityName;
  @override
  @JsonKey(name: 'InstantURL')
  final String? instantURL;
  @override
  @JsonKey(name: 'ScheduleURL')
  final String? scheduleURL;
  @override
  @JsonKey(name: 'eclinic_Flag')
  final dynamic eClinicFlag;

  @override
  String toString() {
    return 'AppointmentData(type: $type, freeReview: $freeReview, id: $id, date: $date, time: $time, doctorId: $doctorId, doctorName: $doctorName, doctorCategory: $doctorCategory, doctorImage: $doctorImage, cityName: $cityName, instantURL: $instantURL, scheduleURL: $scheduleURL, eClinicFlag: $eClinicFlag)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppointmentDataImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.freeReview, freeReview) ||
                other.freeReview == freeReview) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.doctorId, doctorId) ||
                other.doctorId == doctorId) &&
            (identical(other.doctorName, doctorName) ||
                other.doctorName == doctorName) &&
            (identical(other.doctorCategory, doctorCategory) ||
                other.doctorCategory == doctorCategory) &&
            (identical(other.doctorImage, doctorImage) ||
                other.doctorImage == doctorImage) &&
            (identical(other.cityName, cityName) ||
                other.cityName == cityName) &&
            (identical(other.instantURL, instantURL) ||
                other.instantURL == instantURL) &&
            (identical(other.scheduleURL, scheduleURL) ||
                other.scheduleURL == scheduleURL) &&
            const DeepCollectionEquality()
                .equals(other.eClinicFlag, eClinicFlag));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      type,
      freeReview,
      id,
      date,
      time,
      doctorId,
      doctorName,
      doctorCategory,
      doctorImage,
      cityName,
      instantURL,
      scheduleURL,
      const DeepCollectionEquality().hash(eClinicFlag));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppointmentDataImplCopyWith<_$AppointmentDataImpl> get copyWith =>
      __$$AppointmentDataImplCopyWithImpl<_$AppointmentDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppointmentDataImplToJson(
      this,
    );
  }
}

abstract class _AppointmentData implements AppointmentData {
  const factory _AppointmentData(
          {@JsonKey(name: 'Type') final String? type,
          @JsonKey(name: 'FreeReview') final int? freeReview,
          @JsonKey(name: 'Appointment_id') final int? id,
          @JsonKey(name: 'Appointment_Date') final String? date,
          @JsonKey(name: 'Appointment_Time') final String? time,
          @JsonKey(name: 'Doctor_id') final int? doctorId,
          @JsonKey(name: 'Doctor_Name') final String? doctorName,
          @JsonKey(name: 'DoctorCategory_Name') final String? doctorCategory,
          @JsonKey(name: 'Doctor_Image') final String? doctorImage,
          @JsonKey(name: 'City_Name') final String? cityName,
          @JsonKey(name: 'InstantURL') final String? instantURL,
          @JsonKey(name: 'ScheduleURL') final String? scheduleURL,
          @JsonKey(name: 'eclinic_Flag') final dynamic eClinicFlag}) =
      _$AppointmentDataImpl;

  factory _AppointmentData.fromJson(Map<String, dynamic> json) =
      _$AppointmentDataImpl.fromJson;

  @override
  @JsonKey(name: 'Type')
  String? get type;
  @override
  @JsonKey(name: 'FreeReview')
  int? get freeReview;
  @override
  @JsonKey(name: 'Appointment_id')
  int? get id;
  @override
  @JsonKey(name: 'Appointment_Date')
  String? get date;
  @override
  @JsonKey(name: 'Appointment_Time')
  String? get time;
  @override
  @JsonKey(name: 'Doctor_id')
  int? get doctorId;
  @override
  @JsonKey(name: 'Doctor_Name')
  String? get doctorName;
  @override
  @JsonKey(name: 'DoctorCategory_Name')
  String? get doctorCategory;
  @override
  @JsonKey(name: 'Doctor_Image')
  String? get doctorImage;
  @override
  @JsonKey(name: 'City_Name')
  String? get cityName;
  @override
  @JsonKey(name: 'InstantURL')
  String? get instantURL;
  @override
  @JsonKey(name: 'ScheduleURL')
  String? get scheduleURL;
  @override
  @JsonKey(name: 'eclinic_Flag')
  dynamic get eClinicFlag;
  @override
  @JsonKey(ignore: true)
  _$$AppointmentDataImplCopyWith<_$AppointmentDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
