// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'schedule_doctors_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ScheduleDoctorsResponse _$ScheduleDoctorsResponseFromJson(
    Map<String, dynamic> json) {
  return _ScheduleDoctorsResponse.fromJson(json);
}

/// @nodoc
mixin _$ScheduleDoctorsResponse {
  @JsonKey(name: 'DoctorInfo')
  List<InstantDoctor>? get doctors => throw _privateConstructorUsedError;
  @JsonKey(name: 'ClinicFee')
  List<Clinic>? get clinics => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScheduleDoctorsResponseCopyWith<ScheduleDoctorsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduleDoctorsResponseCopyWith<$Res> {
  factory $ScheduleDoctorsResponseCopyWith(ScheduleDoctorsResponse value,
          $Res Function(ScheduleDoctorsResponse) then) =
      _$ScheduleDoctorsResponseCopyWithImpl<$Res, ScheduleDoctorsResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'DoctorInfo') List<InstantDoctor>? doctors,
      @JsonKey(name: 'ClinicFee') List<Clinic>? clinics});
}

/// @nodoc
class _$ScheduleDoctorsResponseCopyWithImpl<$Res,
        $Val extends ScheduleDoctorsResponse>
    implements $ScheduleDoctorsResponseCopyWith<$Res> {
  _$ScheduleDoctorsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? doctors = freezed,
    Object? clinics = freezed,
  }) {
    return _then(_value.copyWith(
      doctors: freezed == doctors
          ? _value.doctors
          : doctors // ignore: cast_nullable_to_non_nullable
              as List<InstantDoctor>?,
      clinics: freezed == clinics
          ? _value.clinics
          : clinics // ignore: cast_nullable_to_non_nullable
              as List<Clinic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ScheduleDoctorsResponseCopyWith<$Res>
    implements $ScheduleDoctorsResponseCopyWith<$Res> {
  factory _$$_ScheduleDoctorsResponseCopyWith(_$_ScheduleDoctorsResponse value,
          $Res Function(_$_ScheduleDoctorsResponse) then) =
      __$$_ScheduleDoctorsResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'DoctorInfo') List<InstantDoctor>? doctors,
      @JsonKey(name: 'ClinicFee') List<Clinic>? clinics});
}

/// @nodoc
class __$$_ScheduleDoctorsResponseCopyWithImpl<$Res>
    extends _$ScheduleDoctorsResponseCopyWithImpl<$Res,
        _$_ScheduleDoctorsResponse>
    implements _$$_ScheduleDoctorsResponseCopyWith<$Res> {
  __$$_ScheduleDoctorsResponseCopyWithImpl(_$_ScheduleDoctorsResponse _value,
      $Res Function(_$_ScheduleDoctorsResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? doctors = freezed,
    Object? clinics = freezed,
  }) {
    return _then(_$_ScheduleDoctorsResponse(
      doctors: freezed == doctors
          ? _value._doctors
          : doctors // ignore: cast_nullable_to_non_nullable
              as List<InstantDoctor>?,
      clinics: freezed == clinics
          ? _value._clinics
          : clinics // ignore: cast_nullable_to_non_nullable
              as List<Clinic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ScheduleDoctorsResponse implements _ScheduleDoctorsResponse {
  const _$_ScheduleDoctorsResponse(
      {@JsonKey(name: 'DoctorInfo') final List<InstantDoctor>? doctors,
      @JsonKey(name: 'ClinicFee') final List<Clinic>? clinics})
      : _doctors = doctors,
        _clinics = clinics;

  factory _$_ScheduleDoctorsResponse.fromJson(Map<String, dynamic> json) =>
      _$$_ScheduleDoctorsResponseFromJson(json);

  final List<InstantDoctor>? _doctors;
  @override
  @JsonKey(name: 'DoctorInfo')
  List<InstantDoctor>? get doctors {
    final value = _doctors;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Clinic>? _clinics;
  @override
  @JsonKey(name: 'ClinicFee')
  List<Clinic>? get clinics {
    final value = _clinics;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ScheduleDoctorsResponse(doctors: $doctors, clinics: $clinics)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ScheduleDoctorsResponse &&
            const DeepCollectionEquality().equals(other._doctors, _doctors) &&
            const DeepCollectionEquality().equals(other._clinics, _clinics));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_doctors),
      const DeepCollectionEquality().hash(_clinics));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ScheduleDoctorsResponseCopyWith<_$_ScheduleDoctorsResponse>
      get copyWith =>
          __$$_ScheduleDoctorsResponseCopyWithImpl<_$_ScheduleDoctorsResponse>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ScheduleDoctorsResponseToJson(
      this,
    );
  }
}

abstract class _ScheduleDoctorsResponse implements ScheduleDoctorsResponse {
  const factory _ScheduleDoctorsResponse(
          {@JsonKey(name: 'DoctorInfo') final List<InstantDoctor>? doctors,
          @JsonKey(name: 'ClinicFee') final List<Clinic>? clinics}) =
      _$_ScheduleDoctorsResponse;

  factory _ScheduleDoctorsResponse.fromJson(Map<String, dynamic> json) =
      _$_ScheduleDoctorsResponse.fromJson;

  @override
  @JsonKey(name: 'DoctorInfo')
  List<InstantDoctor>? get doctors;
  @override
  @JsonKey(name: 'ClinicFee')
  List<Clinic>? get clinics;
  @override
  @JsonKey(ignore: true)
  _$$_ScheduleDoctorsResponseCopyWith<_$_ScheduleDoctorsResponse>
      get copyWith => throw _privateConstructorUsedError;
}
