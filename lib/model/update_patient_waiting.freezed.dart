// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_patient_waiting.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UpdatePatientWaiting _$UpdatePatientWaitingFromJson(Map<String, dynamic> json) {
  return _UpdatePatientWaiting.fromJson(json);
}

/// @nodoc
mixin _$UpdatePatientWaiting {
  int get responseCode => throw _privateConstructorUsedError;
  int get waitingMinutes => throw _privateConstructorUsedError;
  int get queue => throw _privateConstructorUsedError;
  int get totalQueue => throw _privateConstructorUsedError;
  String get dayEndFlag => throw _privateConstructorUsedError;
  String get doctorOnline => throw _privateConstructorUsedError;

  /// Serializes this UpdatePatientWaiting to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdatePatientWaiting
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdatePatientWaitingCopyWith<UpdatePatientWaiting> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdatePatientWaitingCopyWith<$Res> {
  factory $UpdatePatientWaitingCopyWith(UpdatePatientWaiting value,
          $Res Function(UpdatePatientWaiting) then) =
      _$UpdatePatientWaitingCopyWithImpl<$Res, UpdatePatientWaiting>;
  @useResult
  $Res call(
      {int responseCode,
      int waitingMinutes,
      int queue,
      int totalQueue,
      String dayEndFlag,
      String doctorOnline});
}

/// @nodoc
class _$UpdatePatientWaitingCopyWithImpl<$Res,
        $Val extends UpdatePatientWaiting>
    implements $UpdatePatientWaitingCopyWith<$Res> {
  _$UpdatePatientWaitingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdatePatientWaiting
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? responseCode = null,
    Object? waitingMinutes = null,
    Object? queue = null,
    Object? totalQueue = null,
    Object? dayEndFlag = null,
    Object? doctorOnline = null,
  }) {
    return _then(_value.copyWith(
      responseCode: null == responseCode
          ? _value.responseCode
          : responseCode // ignore: cast_nullable_to_non_nullable
              as int,
      waitingMinutes: null == waitingMinutes
          ? _value.waitingMinutes
          : waitingMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      queue: null == queue
          ? _value.queue
          : queue // ignore: cast_nullable_to_non_nullable
              as int,
      totalQueue: null == totalQueue
          ? _value.totalQueue
          : totalQueue // ignore: cast_nullable_to_non_nullable
              as int,
      dayEndFlag: null == dayEndFlag
          ? _value.dayEndFlag
          : dayEndFlag // ignore: cast_nullable_to_non_nullable
              as String,
      doctorOnline: null == doctorOnline
          ? _value.doctorOnline
          : doctorOnline // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdatePatientWaitingImplCopyWith<$Res>
    implements $UpdatePatientWaitingCopyWith<$Res> {
  factory _$$UpdatePatientWaitingImplCopyWith(_$UpdatePatientWaitingImpl value,
          $Res Function(_$UpdatePatientWaitingImpl) then) =
      __$$UpdatePatientWaitingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int responseCode,
      int waitingMinutes,
      int queue,
      int totalQueue,
      String dayEndFlag,
      String doctorOnline});
}

/// @nodoc
class __$$UpdatePatientWaitingImplCopyWithImpl<$Res>
    extends _$UpdatePatientWaitingCopyWithImpl<$Res, _$UpdatePatientWaitingImpl>
    implements _$$UpdatePatientWaitingImplCopyWith<$Res> {
  __$$UpdatePatientWaitingImplCopyWithImpl(_$UpdatePatientWaitingImpl _value,
      $Res Function(_$UpdatePatientWaitingImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdatePatientWaiting
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? responseCode = null,
    Object? waitingMinutes = null,
    Object? queue = null,
    Object? totalQueue = null,
    Object? dayEndFlag = null,
    Object? doctorOnline = null,
  }) {
    return _then(_$UpdatePatientWaitingImpl(
      responseCode: null == responseCode
          ? _value.responseCode
          : responseCode // ignore: cast_nullable_to_non_nullable
              as int,
      waitingMinutes: null == waitingMinutes
          ? _value.waitingMinutes
          : waitingMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      queue: null == queue
          ? _value.queue
          : queue // ignore: cast_nullable_to_non_nullable
              as int,
      totalQueue: null == totalQueue
          ? _value.totalQueue
          : totalQueue // ignore: cast_nullable_to_non_nullable
              as int,
      dayEndFlag: null == dayEndFlag
          ? _value.dayEndFlag
          : dayEndFlag // ignore: cast_nullable_to_non_nullable
              as String,
      doctorOnline: null == doctorOnline
          ? _value.doctorOnline
          : doctorOnline // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdatePatientWaitingImpl implements _UpdatePatientWaiting {
  const _$UpdatePatientWaitingImpl(
      {required this.responseCode,
      required this.waitingMinutes,
      required this.queue,
      required this.totalQueue,
      required this.dayEndFlag,
      required this.doctorOnline});

  factory _$UpdatePatientWaitingImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdatePatientWaitingImplFromJson(json);

  @override
  final int responseCode;
  @override
  final int waitingMinutes;
  @override
  final int queue;
  @override
  final int totalQueue;
  @override
  final String dayEndFlag;
  @override
  final String doctorOnline;

  @override
  String toString() {
    return 'UpdatePatientWaiting(responseCode: $responseCode, waitingMinutes: $waitingMinutes, queue: $queue, totalQueue: $totalQueue, dayEndFlag: $dayEndFlag, doctorOnline: $doctorOnline)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdatePatientWaitingImpl &&
            (identical(other.responseCode, responseCode) ||
                other.responseCode == responseCode) &&
            (identical(other.waitingMinutes, waitingMinutes) ||
                other.waitingMinutes == waitingMinutes) &&
            (identical(other.queue, queue) || other.queue == queue) &&
            (identical(other.totalQueue, totalQueue) ||
                other.totalQueue == totalQueue) &&
            (identical(other.dayEndFlag, dayEndFlag) ||
                other.dayEndFlag == dayEndFlag) &&
            (identical(other.doctorOnline, doctorOnline) ||
                other.doctorOnline == doctorOnline));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, responseCode, waitingMinutes,
      queue, totalQueue, dayEndFlag, doctorOnline);

  /// Create a copy of UpdatePatientWaiting
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdatePatientWaitingImplCopyWith<_$UpdatePatientWaitingImpl>
      get copyWith =>
          __$$UpdatePatientWaitingImplCopyWithImpl<_$UpdatePatientWaitingImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdatePatientWaitingImplToJson(
      this,
    );
  }
}

abstract class _UpdatePatientWaiting implements UpdatePatientWaiting {
  const factory _UpdatePatientWaiting(
      {required final int responseCode,
      required final int waitingMinutes,
      required final int queue,
      required final int totalQueue,
      required final String dayEndFlag,
      required final String doctorOnline}) = _$UpdatePatientWaitingImpl;

  factory _UpdatePatientWaiting.fromJson(Map<String, dynamic> json) =
      _$UpdatePatientWaitingImpl.fromJson;

  @override
  int get responseCode;
  @override
  int get waitingMinutes;
  @override
  int get queue;
  @override
  int get totalQueue;
  @override
  String get dayEndFlag;
  @override
  String get doctorOnline;

  /// Create a copy of UpdatePatientWaiting
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdatePatientWaitingImplCopyWith<_$UpdatePatientWaitingImpl>
      get copyWith => throw _privateConstructorUsedError;
}
