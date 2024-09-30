// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'call_extend.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

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
abstract class _$$CallExtendModelImplCopyWith<$Res>
    implements $CallExtendModelCopyWith<$Res> {
  factory _$$CallExtendModelImplCopyWith(_$CallExtendModelImpl value,
          $Res Function(_$CallExtendModelImpl) then) =
      __$$CallExtendModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String responseCode, String responseMessage});
}

/// @nodoc
class __$$CallExtendModelImplCopyWithImpl<$Res>
    extends _$CallExtendModelCopyWithImpl<$Res, _$CallExtendModelImpl>
    implements _$$CallExtendModelImplCopyWith<$Res> {
  __$$CallExtendModelImplCopyWithImpl(
      _$CallExtendModelImpl _value, $Res Function(_$CallExtendModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? responseCode = null,
    Object? responseMessage = null,
  }) {
    return _then(_$CallExtendModelImpl(
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
class _$CallExtendModelImpl implements _CallExtendModel {
  const _$CallExtendModelImpl(
      {required this.responseCode, required this.responseMessage});

  factory _$CallExtendModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CallExtendModelImplFromJson(json);

  @override
  final String responseCode;
  @override
  final String responseMessage;

  @override
  String toString() {
    return 'CallExtendModel(responseCode: $responseCode, responseMessage: $responseMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CallExtendModelImpl &&
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
  _$$CallExtendModelImplCopyWith<_$CallExtendModelImpl> get copyWith =>
      __$$CallExtendModelImplCopyWithImpl<_$CallExtendModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CallExtendModelImplToJson(
      this,
    );
  }
}

abstract class _CallExtendModel implements CallExtendModel {
  const factory _CallExtendModel(
      {required final String responseCode,
      required final String responseMessage}) = _$CallExtendModelImpl;

  factory _CallExtendModel.fromJson(Map<String, dynamic> json) =
      _$CallExtendModelImpl.fromJson;

  @override
  String get responseCode;
  @override
  String get responseMessage;
  @override
  @JsonKey(ignore: true)
  _$$CallExtendModelImplCopyWith<_$CallExtendModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
