// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'day_slot.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DaySlot _$DaySlotFromJson(Map<String, dynamic> json) {
  return _DaySlot.fromJson(json);
}

/// @nodoc
mixin _$DaySlot {
  dynamic get Time => throw _privateConstructorUsedError;
  dynamic get FromTime => throw _privateConstructorUsedError;
  dynamic get ToTime => throw _privateConstructorUsedError;
  List<String>? get Day => throw _privateConstructorUsedError;
  dynamic get Days_Name => throw _privateConstructorUsedError;
  dynamic get Time_List => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DaySlotCopyWith<DaySlot> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DaySlotCopyWith<$Res> {
  factory $DaySlotCopyWith(DaySlot value, $Res Function(DaySlot) then) =
      _$DaySlotCopyWithImpl<$Res, DaySlot>;
  @useResult
  $Res call(
      {dynamic Time,
      dynamic FromTime,
      dynamic ToTime,
      List<String>? Day,
      dynamic Days_Name,
      dynamic Time_List});
}

/// @nodoc
class _$DaySlotCopyWithImpl<$Res, $Val extends DaySlot>
    implements $DaySlotCopyWith<$Res> {
  _$DaySlotCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? Time = null,
    Object? FromTime = null,
    Object? ToTime = null,
    Object? Day = freezed,
    Object? Days_Name = null,
    Object? Time_List = null,
  }) {
    return _then(_value.copyWith(
      Time: null == Time
          ? _value.Time
          : Time // ignore: cast_nullable_to_non_nullable
              as dynamic,
      FromTime: null == FromTime
          ? _value.FromTime
          : FromTime // ignore: cast_nullable_to_non_nullable
              as dynamic,
      ToTime: null == ToTime
          ? _value.ToTime
          : ToTime // ignore: cast_nullable_to_non_nullable
              as dynamic,
      Day: freezed == Day
          ? _value.Day
          : Day // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      Days_Name: null == Days_Name
          ? _value.Days_Name
          : Days_Name // ignore: cast_nullable_to_non_nullable
              as dynamic,
      Time_List: null == Time_List
          ? _value.Time_List
          : Time_List // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DaySlotCopyWith<$Res> implements $DaySlotCopyWith<$Res> {
  factory _$$_DaySlotCopyWith(
          _$_DaySlot value, $Res Function(_$_DaySlot) then) =
      __$$_DaySlotCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {dynamic Time,
      dynamic FromTime,
      dynamic ToTime,
      List<String>? Day,
      dynamic Days_Name,
      dynamic Time_List});
}

/// @nodoc
class __$$_DaySlotCopyWithImpl<$Res>
    extends _$DaySlotCopyWithImpl<$Res, _$_DaySlot>
    implements _$$_DaySlotCopyWith<$Res> {
  __$$_DaySlotCopyWithImpl(_$_DaySlot _value, $Res Function(_$_DaySlot) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? Time = null,
    Object? FromTime = null,
    Object? ToTime = null,
    Object? Day = freezed,
    Object? Days_Name = null,
    Object? Time_List = null,
  }) {
    return _then(_$_DaySlot(
      Time: null == Time
          ? _value.Time
          : Time // ignore: cast_nullable_to_non_nullable
              as dynamic,
      FromTime: null == FromTime
          ? _value.FromTime
          : FromTime // ignore: cast_nullable_to_non_nullable
              as dynamic,
      ToTime: null == ToTime
          ? _value.ToTime
          : ToTime // ignore: cast_nullable_to_non_nullable
              as dynamic,
      Day: freezed == Day
          ? _value._Day
          : Day // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      Days_Name: null == Days_Name
          ? _value.Days_Name
          : Days_Name // ignore: cast_nullable_to_non_nullable
              as dynamic,
      Time_List: null == Time_List
          ? _value.Time_List
          : Time_List // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DaySlot implements _DaySlot {
  const _$_DaySlot(
      {this.Time = '',
      this.FromTime = '',
      this.ToTime = '',
      final List<String>? Day,
      this.Days_Name = '',
      this.Time_List = ''})
      : _Day = Day;

  factory _$_DaySlot.fromJson(Map<String, dynamic> json) =>
      _$$_DaySlotFromJson(json);

  @override
  @JsonKey()
  final dynamic Time;
  @override
  @JsonKey()
  final dynamic FromTime;
  @override
  @JsonKey()
  final dynamic ToTime;
  final List<String>? _Day;
  @override
  List<String>? get Day {
    final value = _Day;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final dynamic Days_Name;
  @override
  @JsonKey()
  final dynamic Time_List;

  @override
  String toString() {
    return 'DaySlot(Time: $Time, FromTime: $FromTime, ToTime: $ToTime, Day: $Day, Days_Name: $Days_Name, Time_List: $Time_List)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DaySlot &&
            const DeepCollectionEquality().equals(other.Time, Time) &&
            const DeepCollectionEquality().equals(other.FromTime, FromTime) &&
            const DeepCollectionEquality().equals(other.ToTime, ToTime) &&
            const DeepCollectionEquality().equals(other._Day, _Day) &&
            const DeepCollectionEquality().equals(other.Days_Name, Days_Name) &&
            const DeepCollectionEquality().equals(other.Time_List, Time_List));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(Time),
      const DeepCollectionEquality().hash(FromTime),
      const DeepCollectionEquality().hash(ToTime),
      const DeepCollectionEquality().hash(_Day),
      const DeepCollectionEquality().hash(Days_Name),
      const DeepCollectionEquality().hash(Time_List));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DaySlotCopyWith<_$_DaySlot> get copyWith =>
      __$$_DaySlotCopyWithImpl<_$_DaySlot>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DaySlotToJson(
      this,
    );
  }
}

abstract class _DaySlot implements DaySlot {
  const factory _DaySlot(
      {final dynamic Time,
      final dynamic FromTime,
      final dynamic ToTime,
      final List<String>? Day,
      final dynamic Days_Name,
      final dynamic Time_List}) = _$_DaySlot;

  factory _DaySlot.fromJson(Map<String, dynamic> json) = _$_DaySlot.fromJson;

  @override
  dynamic get Time;
  @override
  dynamic get FromTime;
  @override
  dynamic get ToTime;
  @override
  List<String>? get Day;
  @override
  dynamic get Days_Name;
  @override
  dynamic get Time_List;
  @override
  @JsonKey(ignore: true)
  _$$_DaySlotCopyWith<_$_DaySlot> get copyWith =>
      throw _privateConstructorUsedError;
}
