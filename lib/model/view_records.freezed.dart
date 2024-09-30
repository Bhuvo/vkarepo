// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'view_records.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ViewRecords _$ViewRecordsFromJson(Map<String, dynamic> json) {
  return _ViewRecords.fromJson(json);
}

/// @nodoc
mixin _$ViewRecords {
  dynamic get id => throw _privateConstructorUsedError;
  dynamic get Name => throw _privateConstructorUsedError;
  dynamic get Description => throw _privateConstructorUsedError;
  dynamic get Date => throw _privateConstructorUsedError;
  dynamic get Type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ViewRecordsCopyWith<ViewRecords> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViewRecordsCopyWith<$Res> {
  factory $ViewRecordsCopyWith(
          ViewRecords value, $Res Function(ViewRecords) then) =
      _$ViewRecordsCopyWithImpl<$Res, ViewRecords>;
  @useResult
  $Res call(
      {dynamic id,
      dynamic Name,
      dynamic Description,
      dynamic Date,
      dynamic Type});
}

/// @nodoc
class _$ViewRecordsCopyWithImpl<$Res, $Val extends ViewRecords>
    implements $ViewRecordsCopyWith<$Res> {
  _$ViewRecordsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? Name = freezed,
    Object? Description = freezed,
    Object? Date = freezed,
    Object? Type = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as dynamic,
      Name: freezed == Name
          ? _value.Name
          : Name // ignore: cast_nullable_to_non_nullable
              as dynamic,
      Description: freezed == Description
          ? _value.Description
          : Description // ignore: cast_nullable_to_non_nullable
              as dynamic,
      Date: freezed == Date
          ? _value.Date
          : Date // ignore: cast_nullable_to_non_nullable
              as dynamic,
      Type: freezed == Type
          ? _value.Type
          : Type // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ViewRecordsImplCopyWith<$Res>
    implements $ViewRecordsCopyWith<$Res> {
  factory _$$ViewRecordsImplCopyWith(
          _$ViewRecordsImpl value, $Res Function(_$ViewRecordsImpl) then) =
      __$$ViewRecordsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {dynamic id,
      dynamic Name,
      dynamic Description,
      dynamic Date,
      dynamic Type});
}

/// @nodoc
class __$$ViewRecordsImplCopyWithImpl<$Res>
    extends _$ViewRecordsCopyWithImpl<$Res, _$ViewRecordsImpl>
    implements _$$ViewRecordsImplCopyWith<$Res> {
  __$$ViewRecordsImplCopyWithImpl(
      _$ViewRecordsImpl _value, $Res Function(_$ViewRecordsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? Name = freezed,
    Object? Description = freezed,
    Object? Date = freezed,
    Object? Type = freezed,
  }) {
    return _then(_$ViewRecordsImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as dynamic,
      Name: freezed == Name
          ? _value.Name
          : Name // ignore: cast_nullable_to_non_nullable
              as dynamic,
      Description: freezed == Description
          ? _value.Description
          : Description // ignore: cast_nullable_to_non_nullable
              as dynamic,
      Date: freezed == Date
          ? _value.Date
          : Date // ignore: cast_nullable_to_non_nullable
              as dynamic,
      Type: freezed == Type
          ? _value.Type
          : Type // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ViewRecordsImpl implements _ViewRecords {
  const _$ViewRecordsImpl(
      {this.id = '',
      this.Name = '',
      this.Description = '',
      this.Date = '',
      this.Type = ''});

  factory _$ViewRecordsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ViewRecordsImplFromJson(json);

  @override
  @JsonKey()
  final dynamic id;
  @override
  @JsonKey()
  final dynamic Name;
  @override
  @JsonKey()
  final dynamic Description;
  @override
  @JsonKey()
  final dynamic Date;
  @override
  @JsonKey()
  final dynamic Type;

  @override
  String toString() {
    return 'ViewRecords(id: $id, Name: $Name, Description: $Description, Date: $Date, Type: $Type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ViewRecordsImpl &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.Name, Name) &&
            const DeepCollectionEquality()
                .equals(other.Description, Description) &&
            const DeepCollectionEquality().equals(other.Date, Date) &&
            const DeepCollectionEquality().equals(other.Type, Type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(Name),
      const DeepCollectionEquality().hash(Description),
      const DeepCollectionEquality().hash(Date),
      const DeepCollectionEquality().hash(Type));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ViewRecordsImplCopyWith<_$ViewRecordsImpl> get copyWith =>
      __$$ViewRecordsImplCopyWithImpl<_$ViewRecordsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ViewRecordsImplToJson(
      this,
    );
  }
}

abstract class _ViewRecords implements ViewRecords {
  const factory _ViewRecords(
      {final dynamic id,
      final dynamic Name,
      final dynamic Description,
      final dynamic Date,
      final dynamic Type}) = _$ViewRecordsImpl;

  factory _ViewRecords.fromJson(Map<String, dynamic> json) =
      _$ViewRecordsImpl.fromJson;

  @override
  dynamic get id;
  @override
  dynamic get Name;
  @override
  dynamic get Description;
  @override
  dynamic get Date;
  @override
  dynamic get Type;
  @override
  @JsonKey(ignore: true)
  _$$ViewRecordsImplCopyWith<_$ViewRecordsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
