// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'api_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ApiResponse _$ApiResponseFromJson(Map<String, dynamic> json) {
  return _ApiResponse.fromJson(json);
}

/// @nodoc
mixin _$ApiResponse {
  @JsonKey(name: 'ResponseMessage')
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'Message')
  dynamic? get Rmessage => throw _privateConstructorUsedError;
  @JsonKey(name: 'Key')
  dynamic? get Rkey => throw _privateConstructorUsedError;
  @JsonKey(name: 'ResponseCode')
  dynamic? get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'Responsecode')
  dynamic? get Rcode => throw _privateConstructorUsedError;
  @JsonKey(name: 'R')
  dynamic? get R => throw _privateConstructorUsedError;
  @JsonKey(name: 'Data')
  dynamic get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApiResponseCopyWith<ApiResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiResponseCopyWith<$Res> {
  factory $ApiResponseCopyWith(
          ApiResponse value, $Res Function(ApiResponse) then) =
      _$ApiResponseCopyWithImpl<$Res, ApiResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ResponseMessage') String? message,
      @JsonKey(name: 'Message') dynamic? Rmessage,
      @JsonKey(name: 'Key') dynamic? Rkey,
      @JsonKey(name: 'ResponseCode') dynamic? code,
      @JsonKey(name: 'Responsecode') dynamic? Rcode,
      @JsonKey(name: 'R') dynamic? R,
      @JsonKey(name: 'Data') dynamic data});
}

/// @nodoc
class _$ApiResponseCopyWithImpl<$Res, $Val extends ApiResponse>
    implements $ApiResponseCopyWith<$Res> {
  _$ApiResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? Rmessage = null,
    Object? Rkey = null,
    Object? code = null,
    Object? Rcode = null,
    Object? R = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      Rmessage: null == Rmessage
          ? _value.Rmessage
          : Rmessage // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      Rkey: null == Rkey
          ? _value.Rkey
          : Rkey // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      Rcode: null == Rcode
          ? _value.Rcode
          : Rcode // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      R: null == R
          ? _value.R
          : R // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ApiResponseCopyWith<$Res>
    implements $ApiResponseCopyWith<$Res> {
  factory _$$_ApiResponseCopyWith(
          _$_ApiResponse value, $Res Function(_$_ApiResponse) then) =
      __$$_ApiResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ResponseMessage') String? message,
      @JsonKey(name: 'Message') dynamic? Rmessage,
      @JsonKey(name: 'Key') dynamic? Rkey,
      @JsonKey(name: 'ResponseCode') dynamic? code,
      @JsonKey(name: 'Responsecode') dynamic? Rcode,
      @JsonKey(name: 'R') dynamic? R,
      @JsonKey(name: 'Data') dynamic data});
}

/// @nodoc
class __$$_ApiResponseCopyWithImpl<$Res>
    extends _$ApiResponseCopyWithImpl<$Res, _$_ApiResponse>
    implements _$$_ApiResponseCopyWith<$Res> {
  __$$_ApiResponseCopyWithImpl(
      _$_ApiResponse _value, $Res Function(_$_ApiResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? Rmessage = null,
    Object? Rkey = null,
    Object? code = null,
    Object? Rcode = null,
    Object? R = null,
    Object? data = null,
  }) {
    return _then(_$_ApiResponse(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      Rmessage: null == Rmessage
          ? _value.Rmessage
          : Rmessage // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      Rkey: null == Rkey
          ? _value.Rkey
          : Rkey // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      Rcode: null == Rcode
          ? _value.Rcode
          : Rcode // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      R: null == R
          ? _value.R
          : R // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ApiResponse implements _ApiResponse {
  const _$_ApiResponse(
      {@JsonKey(name: 'ResponseMessage') this.message,
      @JsonKey(name: 'Message') this.Rmessage,
      @JsonKey(name: 'Key') this.Rkey,
      @JsonKey(name: 'ResponseCode') this.code,
      @JsonKey(name: 'Responsecode') this.Rcode,
      @JsonKey(name: 'R') this.R,
      @JsonKey(name: 'Data') this.data = null});

  factory _$_ApiResponse.fromJson(Map<String, dynamic> json) =>
      _$$_ApiResponseFromJson(json);

  @override
  @JsonKey(name: 'ResponseMessage')
  final String? message;
  @override
  @JsonKey(name: 'Message')
  final dynamic? Rmessage;
  @override
  @JsonKey(name: 'Key')
  final dynamic? Rkey;
  @override
  @JsonKey(name: 'ResponseCode')
  final dynamic? code;
  @override
  @JsonKey(name: 'Responsecode')
  final dynamic? Rcode;
  @override
  @JsonKey(name: 'R')
  final dynamic? R;
  @override
  @JsonKey(name: 'Data')
  final dynamic data;

  @override
  String toString() {
    return 'ApiResponse(message: $message, Rmessage: $Rmessage, Rkey: $Rkey, code: $code, Rcode: $Rcode, R: $R, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ApiResponse &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other.Rmessage, Rmessage) &&
            const DeepCollectionEquality().equals(other.Rkey, Rkey) &&
            const DeepCollectionEquality().equals(other.code, code) &&
            const DeepCollectionEquality().equals(other.Rcode, Rcode) &&
            const DeepCollectionEquality().equals(other.R, R) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      message,
      const DeepCollectionEquality().hash(Rmessage),
      const DeepCollectionEquality().hash(Rkey),
      const DeepCollectionEquality().hash(code),
      const DeepCollectionEquality().hash(Rcode),
      const DeepCollectionEquality().hash(R),
      const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ApiResponseCopyWith<_$_ApiResponse> get copyWith =>
      __$$_ApiResponseCopyWithImpl<_$_ApiResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ApiResponseToJson(
      this,
    );
  }
}

abstract class _ApiResponse implements ApiResponse {
  const factory _ApiResponse(
      {@JsonKey(name: 'ResponseMessage') final String? message,
      @JsonKey(name: 'Message') final dynamic? Rmessage,
      @JsonKey(name: 'Key') final dynamic? Rkey,
      @JsonKey(name: 'ResponseCode') final dynamic? code,
      @JsonKey(name: 'Responsecode') final dynamic? Rcode,
      @JsonKey(name: 'R') final dynamic? R,
      @JsonKey(name: 'Data') final dynamic data}) = _$_ApiResponse;

  factory _ApiResponse.fromJson(Map<String, dynamic> json) =
      _$_ApiResponse.fromJson;

  @override
  @JsonKey(name: 'ResponseMessage')
  String? get message;
  @override
  @JsonKey(name: 'Message')
  dynamic? get Rmessage;
  @override
  @JsonKey(name: 'Key')
  dynamic? get Rkey;
  @override
  @JsonKey(name: 'ResponseCode')
  dynamic? get code;
  @override
  @JsonKey(name: 'Responsecode')
  dynamic? get Rcode;
  @override
  @JsonKey(name: 'R')
  dynamic? get R;
  @override
  @JsonKey(name: 'Data')
  dynamic get data;
  @override
  @JsonKey(ignore: true)
  _$$_ApiResponseCopyWith<_$_ApiResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
