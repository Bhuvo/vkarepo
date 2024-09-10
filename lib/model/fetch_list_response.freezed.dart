// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'fetch_list_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
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

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? code = null,
    Object? data = null,
    Object? payload = null,
  }) {
    return _then(_value.copyWith(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as dynamic,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic,
      payload: null == payload
          ? _value.payload
          : payload // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FetchListResponseCopyWith<$Res>
    implements $FetchListResponseCopyWith<$Res> {
  factory _$$_FetchListResponseCopyWith(_$_FetchListResponse value,
          $Res Function(_$_FetchListResponse) then) =
      __$$_FetchListResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ResponseMessage') String? message,
      @JsonKey(name: 'ResponseCode') dynamic code,
      @JsonKey(name: 'Data') dynamic data,
      @JsonKey(name: 'data') dynamic payload});
}

/// @nodoc
class __$$_FetchListResponseCopyWithImpl<$Res>
    extends _$FetchListResponseCopyWithImpl<$Res, _$_FetchListResponse>
    implements _$$_FetchListResponseCopyWith<$Res> {
  __$$_FetchListResponseCopyWithImpl(
      _$_FetchListResponse _value, $Res Function(_$_FetchListResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? code = null,
    Object? data = null,
    Object? payload = null,
  }) {
    return _then(_$_FetchListResponse(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as dynamic,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic,
      payload: null == payload
          ? _value.payload
          : payload // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FetchListResponse implements _FetchListResponse {
  const _$_FetchListResponse(
      {@JsonKey(name: 'ResponseMessage') this.message,
      @JsonKey(name: 'ResponseCode') this.code = null,
      @JsonKey(name: 'Data') this.data = const [],
      @JsonKey(name: 'data') this.payload = const []});

  factory _$_FetchListResponse.fromJson(Map<String, dynamic> json) =>
      _$$_FetchListResponseFromJson(json);

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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FetchListResponse &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other.code, code) &&
            const DeepCollectionEquality().equals(other.data, data) &&
            const DeepCollectionEquality().equals(other.payload, payload));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      message,
      const DeepCollectionEquality().hash(code),
      const DeepCollectionEquality().hash(data),
      const DeepCollectionEquality().hash(payload));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FetchListResponseCopyWith<_$_FetchListResponse> get copyWith =>
      __$$_FetchListResponseCopyWithImpl<_$_FetchListResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FetchListResponseToJson(
      this,
    );
  }
}

abstract class _FetchListResponse implements FetchListResponse {
  const factory _FetchListResponse(
      {@JsonKey(name: 'ResponseMessage') final String? message,
      @JsonKey(name: 'ResponseCode') final dynamic code,
      @JsonKey(name: 'Data') final dynamic data,
      @JsonKey(name: 'data') final dynamic payload}) = _$_FetchListResponse;

  factory _FetchListResponse.fromJson(Map<String, dynamic> json) =
      _$_FetchListResponse.fromJson;

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
  @override
  @JsonKey(ignore: true)
  _$$_FetchListResponseCopyWith<_$_FetchListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
