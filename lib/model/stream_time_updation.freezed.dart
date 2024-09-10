// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'stream_time_updation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
abstract class _$$_StreamTimeUpdationModelCopyWith<$Res>
    implements $StreamTimeUpdationModelCopyWith<$Res> {
  factory _$$_StreamTimeUpdationModelCopyWith(_$_StreamTimeUpdationModel value,
          $Res Function(_$_StreamTimeUpdationModel) then) =
      __$$_StreamTimeUpdationModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String responseCode, String responseMessage});
}

/// @nodoc
class __$$_StreamTimeUpdationModelCopyWithImpl<$Res>
    extends _$StreamTimeUpdationModelCopyWithImpl<$Res,
        _$_StreamTimeUpdationModel>
    implements _$$_StreamTimeUpdationModelCopyWith<$Res> {
  __$$_StreamTimeUpdationModelCopyWithImpl(_$_StreamTimeUpdationModel _value,
      $Res Function(_$_StreamTimeUpdationModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? responseCode = null,
    Object? responseMessage = null,
  }) {
    return _then(_$_StreamTimeUpdationModel(
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
class _$_StreamTimeUpdationModel implements _StreamTimeUpdationModel {
  const _$_StreamTimeUpdationModel(
      {required this.responseCode, required this.responseMessage});

  factory _$_StreamTimeUpdationModel.fromJson(Map<String, dynamic> json) =>
      _$$_StreamTimeUpdationModelFromJson(json);

  @override
  final String responseCode;
  @override
  final String responseMessage;

  @override
  String toString() {
    return 'StreamTimeUpdationModel(responseCode: $responseCode, responseMessage: $responseMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StreamTimeUpdationModel &&
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
  _$$_StreamTimeUpdationModelCopyWith<_$_StreamTimeUpdationModel>
      get copyWith =>
          __$$_StreamTimeUpdationModelCopyWithImpl<_$_StreamTimeUpdationModel>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StreamTimeUpdationModelToJson(
      this,
    );
  }
}

abstract class _StreamTimeUpdationModel implements StreamTimeUpdationModel {
  const factory _StreamTimeUpdationModel(
      {required final String responseCode,
      required final String responseMessage}) = _$_StreamTimeUpdationModel;

  factory _StreamTimeUpdationModel.fromJson(Map<String, dynamic> json) =
      _$_StreamTimeUpdationModel.fromJson;

  @override
  String get responseCode;
  @override
  String get responseMessage;
  @override
  @JsonKey(ignore: true)
  _$$_StreamTimeUpdationModelCopyWith<_$_StreamTimeUpdationModel>
      get copyWith => throw _privateConstructorUsedError;
}
