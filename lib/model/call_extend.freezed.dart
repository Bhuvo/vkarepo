// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'call_extend.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CallExtendModel _$CallExtendModelFromJson(Map<String, dynamic> json) {
  return _CallExtendModel.fromJson(json);
}

/// @nodoc
mixin _$CallExtendModel {
  String get responseCode => throw _privateConstructorUsedError;
  String get responseMessage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CallExtendModelCopyWith<CallExtendModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CallExtendModelCopyWith<$Res> {
  factory $CallExtendModelCopyWith(
          CallExtendModel value, $Res Function(CallExtendModel) then) =
      _$CallExtendModelCopyWithImpl<$Res, CallExtendModel>;
  @useResult
  $Res call({String responseCode, String responseMessage});
}

/// @nodoc
class _$CallExtendModelCopyWithImpl<$Res, $Val extends CallExtendModel>
    implements $CallExtendModelCopyWith<$Res> {
  _$CallExtendModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? responseCode = null,
    Object? responseMessage = null,
  }) {
    return _then(_value.copyWith(
      responseCode: null == responseCode
          ? _value.responseCode
          : responseCode // ignore: cast_nullable_to_non_nullable
              as String,
      responseMessage: null == responseMessage
          ? _value.responseMessage
          : responseMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CallExtendModelCopyWith<$Res>
    implements $CallExtendModelCopyWith<$Res> {
  factory _$$_CallExtendModelCopyWith(
          _$_CallExtendModel value, $Res Function(_$_CallExtendModel) then) =
      __$$_CallExtendModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String responseCode, String responseMessage});
}

/// @nodoc
class __$$_CallExtendModelCopyWithImpl<$Res>
    extends _$CallExtendModelCopyWithImpl<$Res, _$_CallExtendModel>
    implements _$$_CallExtendModelCopyWith<$Res> {
  __$$_CallExtendModelCopyWithImpl(
      _$_CallExtendModel _value, $Res Function(_$_CallExtendModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? responseCode = null,
    Object? responseMessage = null,
  }) {
    return _then(_$_CallExtendModel(
      responseCode: null == responseCode
          ? _value.responseCode
          : responseCode // ignore: cast_nullable_to_non_nullable
              as String,
      responseMessage: null == responseMessage
          ? _value.responseMessage
          : responseMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CallExtendModel implements _CallExtendModel {
  const _$_CallExtendModel(
      {required this.responseCode, required this.responseMessage});

  factory _$_CallExtendModel.fromJson(Map<String, dynamic> json) =>
      _$$_CallExtendModelFromJson(json);

  @override
  final String responseCode;
  @override
  final String responseMessage;

  @override
  String toString() {
    return 'CallExtendModel(responseCode: $responseCode, responseMessage: $responseMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CallExtendModel &&
            (identical(other.responseCode, responseCode) ||
                other.responseCode == responseCode) &&
            (identical(other.responseMessage, responseMessage) ||
                other.responseMessage == responseMessage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, responseCode, responseMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CallExtendModelCopyWith<_$_CallExtendModel> get copyWith =>
      __$$_CallExtendModelCopyWithImpl<_$_CallExtendModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CallExtendModelToJson(
      this,
    );
  }
}

abstract class _CallExtendModel implements CallExtendModel {
  const factory _CallExtendModel(
      {required final String responseCode,
      required final String responseMessage}) = _$_CallExtendModel;

  factory _CallExtendModel.fromJson(Map<String, dynamic> json) =
      _$_CallExtendModel.fromJson;

  @override
  String get responseCode;
  @override
  String get responseMessage;
  @override
  @JsonKey(ignore: true)
  _$$_CallExtendModelCopyWith<_$_CallExtendModel> get copyWith =>
      throw _privateConstructorUsedError;
}
