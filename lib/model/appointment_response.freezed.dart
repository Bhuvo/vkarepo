// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'appointment_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AppointmentResponse _$AppointmentResponseFromJson(Map<String, dynamic> json) {
  return _AppointmentResponse.fromJson(json);
}

/// @nodoc
mixin _$AppointmentResponse {
  @JsonKey(name: 'PreviousAppointmentList')
  List<AppointmentData>? get previous => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpcomingAppointmentList')
  List<AppointmentData>? get upcoming => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppointmentResponseCopyWith<AppointmentResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppointmentResponseCopyWith<$Res> {
  factory $AppointmentResponseCopyWith(
          AppointmentResponse value, $Res Function(AppointmentResponse) then) =
      _$AppointmentResponseCopyWithImpl<$Res, AppointmentResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'PreviousAppointmentList')
          List<AppointmentData>? previous,
      @JsonKey(name: 'UpcomingAppointmentList')
          List<AppointmentData>? upcoming});
}

/// @nodoc
class _$AppointmentResponseCopyWithImpl<$Res, $Val extends AppointmentResponse>
    implements $AppointmentResponseCopyWith<$Res> {
  _$AppointmentResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? previous = freezed,
    Object? upcoming = freezed,
  }) {
    return _then(_value.copyWith(
      previous: freezed == previous
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as List<AppointmentData>?,
      upcoming: freezed == upcoming
          ? _value.upcoming
          : upcoming // ignore: cast_nullable_to_non_nullable
              as List<AppointmentData>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AppointmentResponseCopyWith<$Res>
    implements $AppointmentResponseCopyWith<$Res> {
  factory _$$_AppointmentResponseCopyWith(_$_AppointmentResponse value,
          $Res Function(_$_AppointmentResponse) then) =
      __$$_AppointmentResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'PreviousAppointmentList')
          List<AppointmentData>? previous,
      @JsonKey(name: 'UpcomingAppointmentList')
          List<AppointmentData>? upcoming});
}

/// @nodoc
class __$$_AppointmentResponseCopyWithImpl<$Res>
    extends _$AppointmentResponseCopyWithImpl<$Res, _$_AppointmentResponse>
    implements _$$_AppointmentResponseCopyWith<$Res> {
  __$$_AppointmentResponseCopyWithImpl(_$_AppointmentResponse _value,
      $Res Function(_$_AppointmentResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? previous = freezed,
    Object? upcoming = freezed,
  }) {
    return _then(_$_AppointmentResponse(
      previous: freezed == previous
          ? _value._previous
          : previous // ignore: cast_nullable_to_non_nullable
              as List<AppointmentData>?,
      upcoming: freezed == upcoming
          ? _value._upcoming
          : upcoming // ignore: cast_nullable_to_non_nullable
              as List<AppointmentData>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AppointmentResponse implements _AppointmentResponse {
  const _$_AppointmentResponse(
      {@JsonKey(name: 'PreviousAppointmentList')
          final List<AppointmentData>? previous,
      @JsonKey(name: 'UpcomingAppointmentList')
          final List<AppointmentData>? upcoming})
      : _previous = previous,
        _upcoming = upcoming;

  factory _$_AppointmentResponse.fromJson(Map<String, dynamic> json) =>
      _$$_AppointmentResponseFromJson(json);

  final List<AppointmentData>? _previous;
  @override
  @JsonKey(name: 'PreviousAppointmentList')
  List<AppointmentData>? get previous {
    final value = _previous;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<AppointmentData>? _upcoming;
  @override
  @JsonKey(name: 'UpcomingAppointmentList')
  List<AppointmentData>? get upcoming {
    final value = _upcoming;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'AppointmentResponse(previous: $previous, upcoming: $upcoming)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppointmentResponse &&
            const DeepCollectionEquality().equals(other._previous, _previous) &&
            const DeepCollectionEquality().equals(other._upcoming, _upcoming));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_previous),
      const DeepCollectionEquality().hash(_upcoming));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppointmentResponseCopyWith<_$_AppointmentResponse> get copyWith =>
      __$$_AppointmentResponseCopyWithImpl<_$_AppointmentResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AppointmentResponseToJson(
      this,
    );
  }
}

abstract class _AppointmentResponse implements AppointmentResponse {
  const factory _AppointmentResponse(
      {@JsonKey(name: 'PreviousAppointmentList')
          final List<AppointmentData>? previous,
      @JsonKey(name: 'UpcomingAppointmentList')
          final List<AppointmentData>? upcoming}) = _$_AppointmentResponse;

  factory _AppointmentResponse.fromJson(Map<String, dynamic> json) =
      _$_AppointmentResponse.fromJson;

  @override
  @JsonKey(name: 'PreviousAppointmentList')
  List<AppointmentData>? get previous;
  @override
  @JsonKey(name: 'UpcomingAppointmentList')
  List<AppointmentData>? get upcoming;
  @override
  @JsonKey(ignore: true)
  _$$_AppointmentResponseCopyWith<_$_AppointmentResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
