// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fetch_list_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FetchListResponse _$FetchListResponseFromJson(Map<String, dynamic> json) {
  return _FetchListResponse.fromJson(json);
}

/// @nodoc
mixin _$FetchListResponse {
  @JsonKey(name: 'ResponseMessage')
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'ResponseCode')
  dynamic get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'Data')
  dynamic get data => throw _privateConstructorUsedError;
  @JsonKey(name: 'data')
  dynamic get payload => throw _privateConstructorUsedError;

  /// Serializes this FetchListResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FetchListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FetchListResponseCopyWith<FetchListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FetchListResponseCopyWith<$Res> {
  factory $FetchListResponseCopyWith(
          FetchListResponse value, $Res Function(FetchListResponse) then) =
      _$FetchListResponseCopyWithImpl<$Res, FetchListResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ResponseMessage') String? message,
      @JsonKey(name: 'ResponseCode') dynamic code,
      @JsonKey(name: 'Data') dynamic data,
      @JsonKey(name: 'data') dynamic payload});
}

/// @nodoc
class _$FetchListResponseCopyWithImpl<$Res, $Val extends FetchListResponse>
    implements $FetchListResponseCopyWith<$Res> {
  _$FetchListResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FetchListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? code = freezed,
    Object? data = freezed,
    Object? payload = freezed,
  }) {
    return _then(_value.copyWith(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as dynamic,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic,
      payload: freezed == payload
          ? _value.payload
          : payload // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FetchListResponseImplCopyWith<$Res>
    implements $FetchListResponseCopyWith<$Res> {
  factory _$$FetchListResponseImplCopyWith(_$FetchListResponseImpl value,
          $Res Function(_$FetchListResponseImpl) then) =
      __$$FetchListResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ResponseMessage') String? message,
      @JsonKey(name: 'ResponseCode') dynamic code,
      @JsonKey(name: 'Data') dynamic data,
      @JsonKey(name: 'data') dynamic payload});
}

/// @nodoc
class __$$FetchListResponseImplCopyWithImpl<$Res>
    extends _$FetchListResponseCopyWithImpl<$Res, _$FetchListResponseImpl>
    implements _$$FetchListResponseImplCopyWith<$Res> {
  __$$FetchListResponseImplCopyWithImpl(_$FetchListResponseImpl _value,
      $Res Function(_$FetchListResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of FetchListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? code = freezed,
    Object? data = freezed,
    Object? payload = freezed,
  }) {
    return _then(_$FetchListResponseImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as dynamic,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic,
      payload: freezed == payload
          ? _value.payload
          : payload // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FetchListResponseImpl implements _FetchListResponse {
  const _$FetchListResponseImpl(
      {@JsonKey(name: 'ResponseMessage') this.message,
      @JsonKey(name: 'ResponseCode') this.code = null,
      @JsonKey(name: 'Data') this.data = const [],
      @JsonKey(name: 'data') this.payload = const []});

  factory _$FetchListResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$FetchListResponseImplFromJson(json);

  @override
  @JsonKey(name: 'ResponseMessage')
  final String? message;
  @override
  @JsonKey(name: 'ResponseCode')
  final dynamic code;
  @override
  @JsonKey(name: 'Data')
  final dynamic data;
  @override
  @JsonKey(name: 'data')
  final dynamic payload;

  @override
  String toString() {
    return 'FetchListResponse(message: $message, code: $code, data: $data, payload: $payload)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchListResponseImpl &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other.code, code) &&
            const DeepCollectionEquality().equals(other.data, data) &&
            const DeepCollectionEquality().equals(other.payload, payload));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      message,
      const DeepCollectionEquality().hash(code),
      const DeepCollectionEquality().hash(data),
      const DeepCollectionEquality().hash(payload));

  /// Create a copy of FetchListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchListResponseImplCopyWith<_$FetchListResponseImpl> get copyWith =>
      __$$FetchListResponseImplCopyWithImpl<_$FetchListResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FetchListResponseImplToJson(
      this,
    );
  }
}

abstract class _FetchListResponse implements FetchListResponse {
  const factory _FetchListResponse(
      {@JsonKey(name: 'ResponseMessage') final String? message,
      @JsonKey(name: 'ResponseCode') final dynamic code,
      @JsonKey(name: 'Data') final dynamic data,
      @JsonKey(name: 'data') final dynamic payload}) = _$FetchListResponseImpl;

  factory _FetchListResponse.fromJson(Map<String, dynamic> json) =
      _$FetchListResponseImpl.fromJson;

  @override
  @JsonKey(name: 'ResponseMessage')
  String? get message;
  @override
  @JsonKey(name: 'ResponseCode')
  dynamic get code;
  @override
  @JsonKey(name: 'Data')
  dynamic get data;
  @override
  @JsonKey(name: 'data')
  dynamic get payload;

  /// Create a copy of FetchListResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FetchListResponseImplCopyWith<_$FetchListResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
