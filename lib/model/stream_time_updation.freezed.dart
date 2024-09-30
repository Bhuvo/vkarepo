// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stream_time_updation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StreamTimeUpdationModel _$StreamTimeUpdationModelFromJson(
    Map<String, dynamic> json) {
  return _StreamTimeUpdationModel.fromJson(json);
}

/// @nodoc
mixin _$StreamTimeUpdationModel {
  String get responseCode => throw _privateConstructorUsedError;
  String get responseMessage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StreamTimeUpdationModelCopyWith<StreamTimeUpdationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StreamTimeUpdationModelCopyWith<$Res> {
  factory $StreamTimeUpdationModelCopyWith(StreamTimeUpdationModel value,
          $Res Function(StreamTimeUpdationModel) then) =
      _$StreamTimeUpdationModelCopyWithImpl<$Res, StreamTimeUpdationModel>;
  @useResult
  $Res call({String responseCode, String responseMessage});
}

/// @nodoc
class _$StreamTimeUpdationModelCopyWithImpl<$Res,
        $Val extends StreamTimeUpdationModel>
    implements $StreamTimeUpdationModelCopyWith<$Res> {
  _$StreamTimeUpdationModelCopyWithImpl(this._value, this._then);

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
abstract class _$$StreamTimeUpdationModelImplCopyWith<$Res>
    implements $StreamTimeUpdationModelCopyWith<$Res> {
  factory _$$StreamTimeUpdationModelImplCopyWith(
          _$StreamTimeUpdationModelImpl value,
          $Res Function(_$StreamTimeUpdationModelImpl) then) =
      __$$StreamTimeUpdationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String responseCode, String responseMessage});
}

/// @nodoc
class __$$StreamTimeUpdationModelImplCopyWithImpl<$Res>
    extends _$StreamTimeUpdationModelCopyWithImpl<$Res,
        _$StreamTimeUpdationModelImpl>
    implements _$$StreamTimeUpdationModelImplCopyWith<$Res> {
  __$$StreamTimeUpdationModelImplCopyWithImpl(
      _$StreamTimeUpdationModelImpl _value,
      $Res Function(_$StreamTimeUpdationModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? responseCode = null,
    Object? responseMessage = null,
  }) {
    return _then(_$StreamTimeUpdationModelImpl(
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
class _$StreamTimeUpdationModelImpl implements _StreamTimeUpdationModel {
  const _$StreamTimeUpdationModelImpl(
      {required this.responseCode, required this.responseMessage});

  factory _$StreamTimeUpdationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StreamTimeUpdationModelImplFromJson(json);

  @override
  final String responseCode;
  @override
  final String responseMessage;

  @override
  String toString() {
    return 'StreamTimeUpdationModel(responseCode: $responseCode, responseMessage: $responseMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StreamTimeUpdationModelImpl &&
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
  _$$StreamTimeUpdationModelImplCopyWith<_$StreamTimeUpdationModelImpl>
      get copyWith => __$$StreamTimeUpdationModelImplCopyWithImpl<
          _$StreamTimeUpdationModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StreamTimeUpdationModelImplToJson(
      this,
    );
  }
}

abstract class _StreamTimeUpdationModel implements StreamTimeUpdationModel {
  const factory _StreamTimeUpdationModel(
      {required final String responseCode,
      required final String responseMessage}) = _$StreamTimeUpdationModelImpl;

  factory _StreamTimeUpdationModel.fromJson(Map<String, dynamic> json) =
      _$StreamTimeUpdationModelImpl.fromJson;

  @override
  String get responseCode;
  @override
  String get responseMessage;
  @override
  @JsonKey(ignore: true)
  _$$StreamTimeUpdationModelImplCopyWith<_$StreamTimeUpdationModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
