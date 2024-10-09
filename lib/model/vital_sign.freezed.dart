// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vital_sign.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VitalSign _$VitalSignFromJson(Map<String, dynamic> json) {
  return _VitalSign.fromJson(json);
}

/// @nodoc
mixin _$VitalSign {
  @JsonKey(name: 'prepared_name')
  String? get preparedName => throw _privateConstructorUsedError;
  @JsonKey(name: 'admission_id')
  int? get admissionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'Saturation')
  String? get saturation => throw _privateConstructorUsedError;
  @JsonKey(name: 'Diastolic')
  String? get diastolic => throw _privateConstructorUsedError;
  @JsonKey(name: 'Systolic')
  String? get systolic => throw _privateConstructorUsedError;
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'date')
  String? get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'time')
  String? get time => throw _privateConstructorUsedError;
  @JsonKey(name: 'patient_id')
  int? get patientId => throw _privateConstructorUsedError;
  @JsonKey(name: 'doctor_id')
  int? get doctorId => throw _privateConstructorUsedError;
  @JsonKey(name: 'pulse_rate')
  String? get pulseRate => throw _privateConstructorUsedError;
  @JsonKey(name: 'temperature')
  String? get temperature => throw _privateConstructorUsedError;
  @JsonKey(name: 'respiration')
  String? get respiration => throw _privateConstructorUsedError;
  @JsonKey(name: 'height')
  String? get height => throw _privateConstructorUsedError;
  @JsonKey(name: 'weight')
  String? get weight => throw _privateConstructorUsedError;

  /// Serializes this VitalSign to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VitalSign
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VitalSignCopyWith<VitalSign> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VitalSignCopyWith<$Res> {
  factory $VitalSignCopyWith(VitalSign value, $Res Function(VitalSign) then) =
      _$VitalSignCopyWithImpl<$Res, VitalSign>;
  @useResult
  $Res call(
      {@JsonKey(name: 'prepared_name') String? preparedName,
      @JsonKey(name: 'admission_id') int? admissionId,
      @JsonKey(name: 'Saturation') String? saturation,
      @JsonKey(name: 'Diastolic') String? diastolic,
      @JsonKey(name: 'Systolic') String? systolic,
      @JsonKey(name: 'id') int? id,
      @JsonKey(name: 'date') String? date,
      @JsonKey(name: 'time') String? time,
      @JsonKey(name: 'patient_id') int? patientId,
      @JsonKey(name: 'doctor_id') int? doctorId,
      @JsonKey(name: 'pulse_rate') String? pulseRate,
      @JsonKey(name: 'temperature') String? temperature,
      @JsonKey(name: 'respiration') String? respiration,
      @JsonKey(name: 'height') String? height,
      @JsonKey(name: 'weight') String? weight});
}

/// @nodoc
class _$VitalSignCopyWithImpl<$Res, $Val extends VitalSign>
    implements $VitalSignCopyWith<$Res> {
  _$VitalSignCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VitalSign
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? preparedName = freezed,
    Object? admissionId = freezed,
    Object? saturation = freezed,
    Object? diastolic = freezed,
    Object? systolic = freezed,
    Object? id = freezed,
    Object? date = freezed,
    Object? time = freezed,
    Object? patientId = freezed,
    Object? doctorId = freezed,
    Object? pulseRate = freezed,
    Object? temperature = freezed,
    Object? respiration = freezed,
    Object? height = freezed,
    Object? weight = freezed,
  }) {
    return _then(_value.copyWith(
      preparedName: freezed == preparedName
          ? _value.preparedName
          : preparedName // ignore: cast_nullable_to_non_nullable
              as String?,
      admissionId: freezed == admissionId
          ? _value.admissionId
          : admissionId // ignore: cast_nullable_to_non_nullable
              as int?,
      saturation: freezed == saturation
          ? _value.saturation
          : saturation // ignore: cast_nullable_to_non_nullable
              as String?,
      diastolic: freezed == diastolic
          ? _value.diastolic
          : diastolic // ignore: cast_nullable_to_non_nullable
              as String?,
      systolic: freezed == systolic
          ? _value.systolic
          : systolic // ignore: cast_nullable_to_non_nullable
              as String?,
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
      patientId: freezed == patientId
          ? _value.patientId
          : patientId // ignore: cast_nullable_to_non_nullable
              as int?,
      doctorId: freezed == doctorId
          ? _value.doctorId
          : doctorId // ignore: cast_nullable_to_non_nullable
              as int?,
      pulseRate: freezed == pulseRate
          ? _value.pulseRate
          : pulseRate // ignore: cast_nullable_to_non_nullable
              as String?,
      temperature: freezed == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as String?,
      respiration: freezed == respiration
          ? _value.respiration
          : respiration // ignore: cast_nullable_to_non_nullable
              as String?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as String?,
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VitalSignImplCopyWith<$Res>
    implements $VitalSignCopyWith<$Res> {
  factory _$$VitalSignImplCopyWith(
          _$VitalSignImpl value, $Res Function(_$VitalSignImpl) then) =
      __$$VitalSignImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'prepared_name') String? preparedName,
      @JsonKey(name: 'admission_id') int? admissionId,
      @JsonKey(name: 'Saturation') String? saturation,
      @JsonKey(name: 'Diastolic') String? diastolic,
      @JsonKey(name: 'Systolic') String? systolic,
      @JsonKey(name: 'id') int? id,
      @JsonKey(name: 'date') String? date,
      @JsonKey(name: 'time') String? time,
      @JsonKey(name: 'patient_id') int? patientId,
      @JsonKey(name: 'doctor_id') int? doctorId,
      @JsonKey(name: 'pulse_rate') String? pulseRate,
      @JsonKey(name: 'temperature') String? temperature,
      @JsonKey(name: 'respiration') String? respiration,
      @JsonKey(name: 'height') String? height,
      @JsonKey(name: 'weight') String? weight});
}

/// @nodoc
class __$$VitalSignImplCopyWithImpl<$Res>
    extends _$VitalSignCopyWithImpl<$Res, _$VitalSignImpl>
    implements _$$VitalSignImplCopyWith<$Res> {
  __$$VitalSignImplCopyWithImpl(
      _$VitalSignImpl _value, $Res Function(_$VitalSignImpl) _then)
      : super(_value, _then);

  /// Create a copy of VitalSign
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? preparedName = freezed,
    Object? admissionId = freezed,
    Object? saturation = freezed,
    Object? diastolic = freezed,
    Object? systolic = freezed,
    Object? id = freezed,
    Object? date = freezed,
    Object? time = freezed,
    Object? patientId = freezed,
    Object? doctorId = freezed,
    Object? pulseRate = freezed,
    Object? temperature = freezed,
    Object? respiration = freezed,
    Object? height = freezed,
    Object? weight = freezed,
  }) {
    return _then(_$VitalSignImpl(
      preparedName: freezed == preparedName
          ? _value.preparedName
          : preparedName // ignore: cast_nullable_to_non_nullable
              as String?,
      admissionId: freezed == admissionId
          ? _value.admissionId
          : admissionId // ignore: cast_nullable_to_non_nullable
              as int?,
      saturation: freezed == saturation
          ? _value.saturation
          : saturation // ignore: cast_nullable_to_non_nullable
              as String?,
      diastolic: freezed == diastolic
          ? _value.diastolic
          : diastolic // ignore: cast_nullable_to_non_nullable
              as String?,
      systolic: freezed == systolic
          ? _value.systolic
          : systolic // ignore: cast_nullable_to_non_nullable
              as String?,
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
      patientId: freezed == patientId
          ? _value.patientId
          : patientId // ignore: cast_nullable_to_non_nullable
              as int?,
      doctorId: freezed == doctorId
          ? _value.doctorId
          : doctorId // ignore: cast_nullable_to_non_nullable
              as int?,
      pulseRate: freezed == pulseRate
          ? _value.pulseRate
          : pulseRate // ignore: cast_nullable_to_non_nullable
              as String?,
      temperature: freezed == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as String?,
      respiration: freezed == respiration
          ? _value.respiration
          : respiration // ignore: cast_nullable_to_non_nullable
              as String?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as String?,
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VitalSignImpl implements _VitalSign {
  const _$VitalSignImpl(
      {@JsonKey(name: 'prepared_name') this.preparedName,
      @JsonKey(name: 'admission_id') this.admissionId,
      @JsonKey(name: 'Saturation') this.saturation,
      @JsonKey(name: 'Diastolic') this.diastolic,
      @JsonKey(name: 'Systolic') this.systolic,
      @JsonKey(name: 'id') this.id,
      @JsonKey(name: 'date') this.date,
      @JsonKey(name: 'time') this.time,
      @JsonKey(name: 'patient_id') this.patientId,
      @JsonKey(name: 'doctor_id') this.doctorId,
      @JsonKey(name: 'pulse_rate') this.pulseRate,
      @JsonKey(name: 'temperature') this.temperature,
      @JsonKey(name: 'respiration') this.respiration,
      @JsonKey(name: 'height') this.height,
      @JsonKey(name: 'weight') this.weight});

  factory _$VitalSignImpl.fromJson(Map<String, dynamic> json) =>
      _$$VitalSignImplFromJson(json);

  @override
  @JsonKey(name: 'prepared_name')
  final String? preparedName;
  @override
  @JsonKey(name: 'admission_id')
  final int? admissionId;
  @override
  @JsonKey(name: 'Saturation')
  final String? saturation;
  @override
  @JsonKey(name: 'Diastolic')
  final String? diastolic;
  @override
  @JsonKey(name: 'Systolic')
  final String? systolic;
  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'date')
  final String? date;
  @override
  @JsonKey(name: 'time')
  final String? time;
  @override
  @JsonKey(name: 'patient_id')
  final int? patientId;
  @override
  @JsonKey(name: 'doctor_id')
  final int? doctorId;
  @override
  @JsonKey(name: 'pulse_rate')
  final String? pulseRate;
  @override
  @JsonKey(name: 'temperature')
  final String? temperature;
  @override
  @JsonKey(name: 'respiration')
  final String? respiration;
  @override
  @JsonKey(name: 'height')
  final String? height;
  @override
  @JsonKey(name: 'weight')
  final String? weight;

  @override
  String toString() {
    return 'VitalSign(preparedName: $preparedName, admissionId: $admissionId, saturation: $saturation, diastolic: $diastolic, systolic: $systolic, id: $id, date: $date, time: $time, patientId: $patientId, doctorId: $doctorId, pulseRate: $pulseRate, temperature: $temperature, respiration: $respiration, height: $height, weight: $weight)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VitalSignImpl &&
            (identical(other.preparedName, preparedName) ||
                other.preparedName == preparedName) &&
            (identical(other.admissionId, admissionId) ||
                other.admissionId == admissionId) &&
            (identical(other.saturation, saturation) ||
                other.saturation == saturation) &&
            (identical(other.diastolic, diastolic) ||
                other.diastolic == diastolic) &&
            (identical(other.systolic, systolic) ||
                other.systolic == systolic) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.patientId, patientId) ||
                other.patientId == patientId) &&
            (identical(other.doctorId, doctorId) ||
                other.doctorId == doctorId) &&
            (identical(other.pulseRate, pulseRate) ||
                other.pulseRate == pulseRate) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.respiration, respiration) ||
                other.respiration == respiration) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.weight, weight) || other.weight == weight));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      preparedName,
      admissionId,
      saturation,
      diastolic,
      systolic,
      id,
      date,
      time,
      patientId,
      doctorId,
      pulseRate,
      temperature,
      respiration,
      height,
      weight);

  /// Create a copy of VitalSign
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VitalSignImplCopyWith<_$VitalSignImpl> get copyWith =>
      __$$VitalSignImplCopyWithImpl<_$VitalSignImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VitalSignImplToJson(
      this,
    );
  }
}

abstract class _VitalSign implements VitalSign {
  const factory _VitalSign(
      {@JsonKey(name: 'prepared_name') final String? preparedName,
      @JsonKey(name: 'admission_id') final int? admissionId,
      @JsonKey(name: 'Saturation') final String? saturation,
      @JsonKey(name: 'Diastolic') final String? diastolic,
      @JsonKey(name: 'Systolic') final String? systolic,
      @JsonKey(name: 'id') final int? id,
      @JsonKey(name: 'date') final String? date,
      @JsonKey(name: 'time') final String? time,
      @JsonKey(name: 'patient_id') final int? patientId,
      @JsonKey(name: 'doctor_id') final int? doctorId,
      @JsonKey(name: 'pulse_rate') final String? pulseRate,
      @JsonKey(name: 'temperature') final String? temperature,
      @JsonKey(name: 'respiration') final String? respiration,
      @JsonKey(name: 'height') final String? height,
      @JsonKey(name: 'weight') final String? weight}) = _$VitalSignImpl;

  factory _VitalSign.fromJson(Map<String, dynamic> json) =
      _$VitalSignImpl.fromJson;

  @override
  @JsonKey(name: 'prepared_name')
  String? get preparedName;
  @override
  @JsonKey(name: 'admission_id')
  int? get admissionId;
  @override
  @JsonKey(name: 'Saturation')
  String? get saturation;
  @override
  @JsonKey(name: 'Diastolic')
  String? get diastolic;
  @override
  @JsonKey(name: 'Systolic')
  String? get systolic;
  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'date')
  String? get date;
  @override
  @JsonKey(name: 'time')
  String? get time;
  @override
  @JsonKey(name: 'patient_id')
  int? get patientId;
  @override
  @JsonKey(name: 'doctor_id')
  int? get doctorId;
  @override
  @JsonKey(name: 'pulse_rate')
  String? get pulseRate;
  @override
  @JsonKey(name: 'temperature')
  String? get temperature;
  @override
  @JsonKey(name: 'respiration')
  String? get respiration;
  @override
  @JsonKey(name: 'height')
  String? get height;
  @override
  @JsonKey(name: 'weight')
  String? get weight;

  /// Create a copy of VitalSign
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VitalSignImplCopyWith<_$VitalSignImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
