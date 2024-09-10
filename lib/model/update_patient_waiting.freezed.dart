// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'update_patient_waiting.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
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
abstract class _$$_UpdatePatientWaitingCopyWith<$Res>
    implements $UpdatePatientWaitingCopyWith<$Res> {
  factory _$$_UpdatePatientWaitingCopyWith(_$_UpdatePatientWaiting value,
          $Res Function(_$_UpdatePatientWaiting) then) =
      __$$_UpdatePatientWaitingCopyWithImpl<$Res>;
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
class __$$_UpdatePatientWaitingCopyWithImpl<$Res>
    extends _$UpdatePatientWaitingCopyWithImpl<$Res, _$_UpdatePatientWaiting>
    implements _$$_UpdatePatientWaitingCopyWith<$Res> {
  __$$_UpdatePatientWaitingCopyWithImpl(_$_UpdatePatientWaiting _value,
      $Res Function(_$_UpdatePatientWaiting) _then)
      : super(_value, _then);

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
    return _then(_$_UpdatePatientWaiting(
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
class _$_UpdatePatientWaiting implements _UpdatePatientWaiting {
  const _$_UpdatePatientWaiting(
      {required this.responseCode,
      required this.waitingMinutes,
      required this.queue,
      required this.totalQueue,
      required this.dayEndFlag,
      required this.doctorOnline});

  factory _$_UpdatePatientWaiting.fromJson(Map<String, dynamic> json) =>
      _$$_UpdatePatientWaitingFromJson(json);

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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdatePatientWaiting &&
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

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, responseCode, waitingMinutes,
      queue, totalQueue, dayEndFlag, doctorOnline);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdatePatientWaitingCopyWith<_$_UpdatePatientWaiting> get copyWith =>
      __$$_UpdatePatientWaitingCopyWithImpl<_$_UpdatePatientWaiting>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UpdatePatientWaitingToJson(
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
      required final String doctorOnline}) = _$_UpdatePatientWaiting;

  factory _UpdatePatientWaiting.fromJson(Map<String, dynamic> json) =
      _$_UpdatePatientWaiting.fromJson;

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
  @override
  @JsonKey(ignore: true)
  _$$_UpdatePatientWaitingCopyWith<_$_UpdatePatientWaiting> get copyWith =>
      throw _privateConstructorUsedError;
}
