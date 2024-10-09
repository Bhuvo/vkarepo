// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

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

  /// Serializes this ApiResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Create a copy of ApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? Rmessage = freezed,
    Object? Rkey = freezed,
    Object? code = freezed,
    Object? Rcode = freezed,
    Object? R = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      Rmessage: freezed == Rmessage
          ? _value.Rmessage
          : Rmessage // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      Rkey: freezed == Rkey
          ? _value.Rkey
          : Rkey // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      Rcode: freezed == Rcode
          ? _value.Rcode
          : Rcode // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      R: freezed == R
          ? _value.R
          : R // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ApiResponseImplCopyWith<$Res>
    implements $ApiResponseCopyWith<$Res> {
  factory _$$ApiResponseImplCopyWith(
          _$ApiResponseImpl value, $Res Function(_$ApiResponseImpl) then) =
      __$$ApiResponseImplCopyWithImpl<$Res>;
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
class __$$ApiResponseImplCopyWithImpl<$Res>
    extends _$ApiResponseCopyWithImpl<$Res, _$ApiResponseImpl>
    implements _$$ApiResponseImplCopyWith<$Res> {
  __$$ApiResponseImplCopyWithImpl(
      _$ApiResponseImpl _value, $Res Function(_$ApiResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? Rmessage = freezed,
    Object? Rkey = freezed,
    Object? code = freezed,
    Object? Rcode = freezed,
    Object? R = freezed,
    Object? data = freezed,
  }) {
    return _then(_$ApiResponseImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      Rmessage: freezed == Rmessage
          ? _value.Rmessage
          : Rmessage // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      Rkey: freezed == Rkey
          ? _value.Rkey
          : Rkey // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      Rcode: freezed == Rcode
          ? _value.Rcode
          : Rcode // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      R: freezed == R
          ? _value.R
          : R // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ApiResponseImpl implements _ApiResponse {
  const _$ApiResponseImpl(
      {@JsonKey(name: 'ResponseMessage') this.message,
      @JsonKey(name: 'Message') this.Rmessage,
      @JsonKey(name: 'Key') this.Rkey,
      @JsonKey(name: 'ResponseCode') this.code,
      @JsonKey(name: 'Responsecode') this.Rcode,
      @JsonKey(name: 'R') this.R,
      @JsonKey(name: 'Data') this.data = null});

  factory _$ApiResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApiResponseImplFromJson(json);

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiResponseImpl &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other.Rmessage, Rmessage) &&
            const DeepCollectionEquality().equals(other.Rkey, Rkey) &&
            const DeepCollectionEquality().equals(other.code, code) &&
            const DeepCollectionEquality().equals(other.Rcode, Rcode) &&
            const DeepCollectionEquality().equals(other.R, R) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Create a copy of ApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiResponseImplCopyWith<_$ApiResponseImpl> get copyWith =>
      __$$ApiResponseImplCopyWithImpl<_$ApiResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ApiResponseImplToJson(
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
      @JsonKey(name: 'Data') final dynamic data}) = _$ApiResponseImpl;

  factory _ApiResponse.fromJson(Map<String, dynamic> json) =
      _$ApiResponseImpl.fromJson;

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

  /// Create a copy of ApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApiResponseImplCopyWith<_$ApiResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
