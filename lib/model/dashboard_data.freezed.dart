// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DashboardData _$DashboardDataFromJson(Map<String, dynamic> json) {
  return _DashboardData.fromJson(json);
}

/// @nodoc
mixin _$DashboardData {
  @JsonKey(name: 'Total_Patient_Count')
  String? get patient => throw _privateConstructorUsedError;
  @JsonKey(name: 'Today_INR_Count')
  String? get inr => throw _privateConstructorUsedError;
  @JsonKey(name: 'Today_Pending_Count')
  String? get pending => throw _privateConstructorUsedError;
  @JsonKey(name: 'Today_Completed_Count')
  String? get completed => throw _privateConstructorUsedError;
  @JsonKey(name: 'Total_Pending_Count')
  String? get totalPending => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DashboardDataCopyWith<DashboardData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardDataCopyWith<$Res> {
  factory $DashboardDataCopyWith(
          DashboardData value, $Res Function(DashboardData) then) =
      _$DashboardDataCopyWithImpl<$Res, DashboardData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'Total_Patient_Count') String? patient,
      @JsonKey(name: 'Today_INR_Count') String? inr,
      @JsonKey(name: 'Today_Pending_Count') String? pending,
      @JsonKey(name: 'Today_Completed_Count') String? completed,
      @JsonKey(name: 'Total_Pending_Count') String? totalPending});
}

/// @nodoc
class _$DashboardDataCopyWithImpl<$Res, $Val extends DashboardData>
    implements $DashboardDataCopyWith<$Res> {
  _$DashboardDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? patient = freezed,
    Object? inr = freezed,
    Object? pending = freezed,
    Object? completed = freezed,
    Object? totalPending = freezed,
  }) {
    return _then(_value.copyWith(
      patient: freezed == patient
          ? _value.patient
          : patient // ignore: cast_nullable_to_non_nullable
              as String?,
      inr: freezed == inr
          ? _value.inr
          : inr // ignore: cast_nullable_to_non_nullable
              as String?,
      pending: freezed == pending
          ? _value.pending
          : pending // ignore: cast_nullable_to_non_nullable
              as String?,
      completed: freezed == completed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as String?,
      totalPending: freezed == totalPending
          ? _value.totalPending
          : totalPending // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DashboardDataImplCopyWith<$Res>
    implements $DashboardDataCopyWith<$Res> {
  factory _$$DashboardDataImplCopyWith(
          _$DashboardDataImpl value, $Res Function(_$DashboardDataImpl) then) =
      __$$DashboardDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'Total_Patient_Count') String? patient,
      @JsonKey(name: 'Today_INR_Count') String? inr,
      @JsonKey(name: 'Today_Pending_Count') String? pending,
      @JsonKey(name: 'Today_Completed_Count') String? completed,
      @JsonKey(name: 'Total_Pending_Count') String? totalPending});
}

/// @nodoc
class __$$DashboardDataImplCopyWithImpl<$Res>
    extends _$DashboardDataCopyWithImpl<$Res, _$DashboardDataImpl>
    implements _$$DashboardDataImplCopyWith<$Res> {
  __$$DashboardDataImplCopyWithImpl(
      _$DashboardDataImpl _value, $Res Function(_$DashboardDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? patient = freezed,
    Object? inr = freezed,
    Object? pending = freezed,
    Object? completed = freezed,
    Object? totalPending = freezed,
  }) {
    return _then(_$DashboardDataImpl(
      patient: freezed == patient
          ? _value.patient
          : patient // ignore: cast_nullable_to_non_nullable
              as String?,
      inr: freezed == inr
          ? _value.inr
          : inr // ignore: cast_nullable_to_non_nullable
              as String?,
      pending: freezed == pending
          ? _value.pending
          : pending // ignore: cast_nullable_to_non_nullable
              as String?,
      completed: freezed == completed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as String?,
      totalPending: freezed == totalPending
          ? _value.totalPending
          : totalPending // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DashboardDataImpl implements _DashboardData {
  const _$DashboardDataImpl(
      {@JsonKey(name: 'Total_Patient_Count') this.patient,
      @JsonKey(name: 'Today_INR_Count') this.inr,
      @JsonKey(name: 'Today_Pending_Count') this.pending,
      @JsonKey(name: 'Today_Completed_Count') this.completed,
      @JsonKey(name: 'Total_Pending_Count') this.totalPending});

  factory _$DashboardDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$DashboardDataImplFromJson(json);

  @override
  @JsonKey(name: 'Total_Patient_Count')
  final String? patient;
  @override
  @JsonKey(name: 'Today_INR_Count')
  final String? inr;
  @override
  @JsonKey(name: 'Today_Pending_Count')
  final String? pending;
  @override
  @JsonKey(name: 'Today_Completed_Count')
  final String? completed;
  @override
  @JsonKey(name: 'Total_Pending_Count')
  final String? totalPending;

  @override
  String toString() {
    return 'DashboardData(patient: $patient, inr: $inr, pending: $pending, completed: $completed, totalPending: $totalPending)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardDataImpl &&
            (identical(other.patient, patient) || other.patient == patient) &&
            (identical(other.inr, inr) || other.inr == inr) &&
            (identical(other.pending, pending) || other.pending == pending) &&
            (identical(other.completed, completed) ||
                other.completed == completed) &&
            (identical(other.totalPending, totalPending) ||
                other.totalPending == totalPending));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, patient, inr, pending, completed, totalPending);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DashboardDataImplCopyWith<_$DashboardDataImpl> get copyWith =>
      __$$DashboardDataImplCopyWithImpl<_$DashboardDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DashboardDataImplToJson(
      this,
    );
  }
}

abstract class _DashboardData implements DashboardData {
  const factory _DashboardData(
          {@JsonKey(name: 'Total_Patient_Count') final String? patient,
          @JsonKey(name: 'Today_INR_Count') final String? inr,
          @JsonKey(name: 'Today_Pending_Count') final String? pending,
          @JsonKey(name: 'Today_Completed_Count') final String? completed,
          @JsonKey(name: 'Total_Pending_Count') final String? totalPending}) =
      _$DashboardDataImpl;

  factory _DashboardData.fromJson(Map<String, dynamic> json) =
      _$DashboardDataImpl.fromJson;

  @override
  @JsonKey(name: 'Total_Patient_Count')
  String? get patient;
  @override
  @JsonKey(name: 'Today_INR_Count')
  String? get inr;
  @override
  @JsonKey(name: 'Today_Pending_Count')
  String? get pending;
  @override
  @JsonKey(name: 'Today_Completed_Count')
  String? get completed;
  @override
  @JsonKey(name: 'Total_Pending_Count')
  String? get totalPending;
  @override
  @JsonKey(ignore: true)
  _$$DashboardDataImplCopyWith<_$DashboardDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
