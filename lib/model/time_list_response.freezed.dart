// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'time_list_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TimeListResponse _$TimeListResponseFromJson(Map<String, dynamic> json) {
  return _TimeListResponse.fromJson(json);
}

/// @nodoc
mixin _$TimeListResponse {
  @JsonKey(name: 'TimeList')
  List<TimeList>? get timeList => throw _privateConstructorUsedError;

  /// Serializes this TimeListResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TimeListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Create a copy of TimeListResponse
  /// with the given fields replaced by the non-null parameter values.
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
abstract class _$$TimeListResponseImplCopyWith<$Res>
    implements $TimeListResponseCopyWith<$Res> {
  factory _$$TimeListResponseImplCopyWith(_$TimeListResponseImpl value,
          $Res Function(_$TimeListResponseImpl) then) =
      __$$TimeListResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'TimeList') List<TimeList>? timeList});
}

/// @nodoc
class __$$TimeListResponseImplCopyWithImpl<$Res>
    extends _$TimeListResponseCopyWithImpl<$Res, _$TimeListResponseImpl>
    implements _$$TimeListResponseImplCopyWith<$Res> {
  __$$TimeListResponseImplCopyWithImpl(_$TimeListResponseImpl _value,
      $Res Function(_$TimeListResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of TimeListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timeList = freezed,
  }) {
    return _then(_$TimeListResponseImpl(
      timeList: freezed == timeList
          ? _value._timeList
          : timeList // ignore: cast_nullable_to_non_nullable
              as List<TimeList>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TimeListResponseImpl implements _TimeListResponse {
  const _$TimeListResponseImpl(
      {@JsonKey(name: 'TimeList') final List<TimeList>? timeList})
      : _timeList = timeList;

  factory _$TimeListResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$TimeListResponseImplFromJson(json);

  final List<TimeList>? _timeList;
  @override
  @JsonKey(name: 'TimeList')
  List<TimeList>? get timeList {
    final value = _timeList;
    if (value == null) return null;
    if (_timeList is EqualUnmodifiableListView) return _timeList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'TimeListResponse(timeList: $timeList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimeListResponseImpl &&
            const DeepCollectionEquality().equals(other._timeList, _timeList));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_timeList));

  /// Create a copy of TimeListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TimeListResponseImplCopyWith<_$TimeListResponseImpl> get copyWith =>
      __$$TimeListResponseImplCopyWithImpl<_$TimeListResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TimeListResponseImplToJson(
      this,
    );
  }
}

abstract class _TimeListResponse implements TimeListResponse {
  const factory _TimeListResponse(
          {@JsonKey(name: 'TimeList') final List<TimeList>? timeList}) =
      _$TimeListResponseImpl;

  factory _TimeListResponse.fromJson(Map<String, dynamic> json) =
      _$TimeListResponseImpl.fromJson;

  @override
  @JsonKey(name: 'TimeList')
  List<TimeList>? get timeList;

  /// Create a copy of TimeListResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TimeListResponseImplCopyWith<_$TimeListResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
