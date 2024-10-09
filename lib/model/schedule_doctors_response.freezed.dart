// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'schedule_doctors_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

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

  /// Serializes this ScheduleDoctorsResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ScheduleDoctorsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Create a copy of ScheduleDoctorsResponse
  /// with the given fields replaced by the non-null parameter values.
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
abstract class _$$ScheduleDoctorsResponseImplCopyWith<$Res>
    implements $ScheduleDoctorsResponseCopyWith<$Res> {
  factory _$$ScheduleDoctorsResponseImplCopyWith(
          _$ScheduleDoctorsResponseImpl value,
          $Res Function(_$ScheduleDoctorsResponseImpl) then) =
      __$$ScheduleDoctorsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'DoctorInfo') List<InstantDoctor>? doctors,
      @JsonKey(name: 'ClinicFee') List<Clinic>? clinics});
}

/// @nodoc
class __$$ScheduleDoctorsResponseImplCopyWithImpl<$Res>
    extends _$ScheduleDoctorsResponseCopyWithImpl<$Res,
        _$ScheduleDoctorsResponseImpl>
    implements _$$ScheduleDoctorsResponseImplCopyWith<$Res> {
  __$$ScheduleDoctorsResponseImplCopyWithImpl(
      _$ScheduleDoctorsResponseImpl _value,
      $Res Function(_$ScheduleDoctorsResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ScheduleDoctorsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? doctors = freezed,
    Object? clinics = freezed,
  }) {
    return _then(_$ScheduleDoctorsResponseImpl(
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
class _$ScheduleDoctorsResponseImpl implements _ScheduleDoctorsResponse {
  const _$ScheduleDoctorsResponseImpl(
      {@JsonKey(name: 'DoctorInfo') final List<InstantDoctor>? doctors,
      @JsonKey(name: 'ClinicFee') final List<Clinic>? clinics})
      : _doctors = doctors,
        _clinics = clinics;

  factory _$ScheduleDoctorsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScheduleDoctorsResponseImplFromJson(json);

  final List<InstantDoctor>? _doctors;
  @override
  @JsonKey(name: 'DoctorInfo')
  List<InstantDoctor>? get doctors {
    final value = _doctors;
    if (value == null) return null;
    if (_doctors is EqualUnmodifiableListView) return _doctors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Clinic>? _clinics;
  @override
  @JsonKey(name: 'ClinicFee')
  List<Clinic>? get clinics {
    final value = _clinics;
    if (value == null) return null;
    if (_clinics is EqualUnmodifiableListView) return _clinics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ScheduleDoctorsResponse(doctors: $doctors, clinics: $clinics)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScheduleDoctorsResponseImpl &&
            const DeepCollectionEquality().equals(other._doctors, _doctors) &&
            const DeepCollectionEquality().equals(other._clinics, _clinics));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_doctors),
      const DeepCollectionEquality().hash(_clinics));

  /// Create a copy of ScheduleDoctorsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ScheduleDoctorsResponseImplCopyWith<_$ScheduleDoctorsResponseImpl>
      get copyWith => __$$ScheduleDoctorsResponseImplCopyWithImpl<
          _$ScheduleDoctorsResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScheduleDoctorsResponseImplToJson(
      this,
    );
  }
}

abstract class _ScheduleDoctorsResponse implements ScheduleDoctorsResponse {
  const factory _ScheduleDoctorsResponse(
          {@JsonKey(name: 'DoctorInfo') final List<InstantDoctor>? doctors,
          @JsonKey(name: 'ClinicFee') final List<Clinic>? clinics}) =
      _$ScheduleDoctorsResponseImpl;

  factory _ScheduleDoctorsResponse.fromJson(Map<String, dynamic> json) =
      _$ScheduleDoctorsResponseImpl.fromJson;

  @override
  @JsonKey(name: 'DoctorInfo')
  List<InstantDoctor>? get doctors;
  @override
  @JsonKey(name: 'ClinicFee')
  List<Clinic>? get clinics;

  /// Create a copy of ScheduleDoctorsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ScheduleDoctorsResponseImplCopyWith<_$ScheduleDoctorsResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
