// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'time_list_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TimeListResponse _$TimeListResponseFromJson(Map<String, dynamic> json) {
  return _TimeListResponse.fromJson(json);
}

/// @nodoc
mixin _$TimeListResponse {
  @JsonKey(name: 'TimeList')
  List<TimeList>? get timeList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TimeListResponseCopyWith<TimeListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimeListResponseCopyWith<$Res> {
  factory $TimeListResponseCopyWith(
          TimeListResponse value, $Res Function(TimeListResponse) then) =
      _$TimeListResponseCopyWithImpl<$Res, TimeListResponse>;
  @useResult
  $Res call({@JsonKey(name: 'TimeList') List<TimeList>? timeList});
}

/// @nodoc
class _$TimeListResponseCopyWithImpl<$Res, $Val extends TimeListResponse>
    implements $TimeListResponseCopyWith<$Res> {
  _$TimeListResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timeList = freezed,
  }) {
    return _then(_value.copyWith(
      timeList: freezed == timeList
          ? _value.timeList
          : timeList // ignore: cast_nullable_to_non_nullable
              as List<TimeList>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TimeListResponseCopyWith<$Res>
    implements $TimeListResponseCopyWith<$Res> {
  factory _$$_TimeListResponseCopyWith(
          _$_TimeListResponse value, $Res Function(_$_TimeListResponse) then) =
      __$$_TimeListResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'TimeList') List<TimeList>? timeList});
}

/// @nodoc
class __$$_TimeListResponseCopyWithImpl<$Res>
    extends _$TimeListResponseCopyWithImpl<$Res, _$_TimeListResponse>
    implements _$$_TimeListResponseCopyWith<$Res> {
  __$$_TimeListResponseCopyWithImpl(
      _$_TimeListResponse _value, $Res Function(_$_TimeListResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timeList = freezed,
  }) {
    return _then(_$_TimeListResponse(
      timeList: freezed == timeList
          ? _value._timeList
          : timeList // ignore: cast_nullable_to_non_nullable
              as List<TimeList>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TimeListResponse implements _TimeListResponse {
  const _$_TimeListResponse(
      {@JsonKey(name: 'TimeList') final List<TimeList>? timeList})
      : _timeList = timeList;

  factory _$_TimeListResponse.fromJson(Map<String, dynamic> json) =>
      _$$_TimeListResponseFromJson(json);

  final List<TimeList>? _timeList;
  @override
  @JsonKey(name: 'TimeList')
  List<TimeList>? get timeList {
    final value = _timeList;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'TimeListResponse(timeList: $timeList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TimeListResponse &&
            const DeepCollectionEquality().equals(other._timeList, _timeList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_timeList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TimeListResponseCopyWith<_$_TimeListResponse> get copyWith =>
      __$$_TimeListResponseCopyWithImpl<_$_TimeListResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TimeListResponseToJson(
      this,
    );
  }
}

abstract class _TimeListResponse implements TimeListResponse {
  const factory _TimeListResponse(
          {@JsonKey(name: 'TimeList') final List<TimeList>? timeList}) =
      _$_TimeListResponse;

  factory _TimeListResponse.fromJson(Map<String, dynamic> json) =
      _$_TimeListResponse.fromJson;

  @override
  @JsonKey(name: 'TimeList')
  List<TimeList>? get timeList;
  @override
  @JsonKey(ignore: true)
  _$$_TimeListResponseCopyWith<_$_TimeListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
