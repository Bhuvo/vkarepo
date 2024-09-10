// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'view_records.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
    Object? id = null,
    Object? Name = null,
    Object? Description = null,
    Object? Date = null,
    Object? Type = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as dynamic,
      Name: null == Name
          ? _value.Name
          : Name // ignore: cast_nullable_to_non_nullable
              as dynamic,
      Description: null == Description
          ? _value.Description
          : Description // ignore: cast_nullable_to_non_nullable
              as dynamic,
      Date: null == Date
          ? _value.Date
          : Date // ignore: cast_nullable_to_non_nullable
              as dynamic,
      Type: null == Type
          ? _value.Type
          : Type // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ViewRecordsCopyWith<$Res>
    implements $ViewRecordsCopyWith<$Res> {
  factory _$$_ViewRecordsCopyWith(
          _$_ViewRecords value, $Res Function(_$_ViewRecords) then) =
      __$$_ViewRecordsCopyWithImpl<$Res>;
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
class __$$_ViewRecordsCopyWithImpl<$Res>
    extends _$ViewRecordsCopyWithImpl<$Res, _$_ViewRecords>
    implements _$$_ViewRecordsCopyWith<$Res> {
  __$$_ViewRecordsCopyWithImpl(
      _$_ViewRecords _value, $Res Function(_$_ViewRecords) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? Name = null,
    Object? Description = null,
    Object? Date = null,
    Object? Type = null,
  }) {
    return _then(_$_ViewRecords(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as dynamic,
      Name: null == Name
          ? _value.Name
          : Name // ignore: cast_nullable_to_non_nullable
              as dynamic,
      Description: null == Description
          ? _value.Description
          : Description // ignore: cast_nullable_to_non_nullable
              as dynamic,
      Date: null == Date
          ? _value.Date
          : Date // ignore: cast_nullable_to_non_nullable
              as dynamic,
      Type: null == Type
          ? _value.Type
          : Type // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ViewRecords implements _ViewRecords {
  const _$_ViewRecords(
      {this.id = '',
      this.Name = '',
      this.Description = '',
      this.Date = '',
      this.Type = ''});

  factory _$_ViewRecords.fromJson(Map<String, dynamic> json) =>
      _$$_ViewRecordsFromJson(json);

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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ViewRecords &&
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
  _$$_ViewRecordsCopyWith<_$_ViewRecords> get copyWith =>
      __$$_ViewRecordsCopyWithImpl<_$_ViewRecords>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ViewRecordsToJson(
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
      final dynamic Type}) = _$_ViewRecords;

  factory _ViewRecords.fromJson(Map<String, dynamic> json) =
      _$_ViewRecords.fromJson;

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
  _$$_ViewRecordsCopyWith<_$_ViewRecords> get copyWith =>
      throw _privateConstructorUsedError;
}
