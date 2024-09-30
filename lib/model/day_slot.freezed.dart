// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'day_slot.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

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
    Object? Time = freezed,
    Object? FromTime = freezed,
    Object? ToTime = freezed,
    Object? Day = freezed,
    Object? Days_Name = freezed,
    Object? Time_List = freezed,
  }) {
    return _then(_value.copyWith(
      Time: freezed == Time
          ? _value.Time
          : Time // ignore: cast_nullable_to_non_nullable
              as dynamic,
      FromTime: freezed == FromTime
          ? _value.FromTime
          : FromTime // ignore: cast_nullable_to_non_nullable
              as dynamic,
      ToTime: freezed == ToTime
          ? _value.ToTime
          : ToTime // ignore: cast_nullable_to_non_nullable
              as dynamic,
      Day: freezed == Day
          ? _value.Day
          : Day // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      Days_Name: freezed == Days_Name
          ? _value.Days_Name
          : Days_Name // ignore: cast_nullable_to_non_nullable
              as dynamic,
      Time_List: freezed == Time_List
          ? _value.Time_List
          : Time_List // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DaySlotImplCopyWith<$Res> implements $DaySlotCopyWith<$Res> {
  factory _$$DaySlotImplCopyWith(
          _$DaySlotImpl value, $Res Function(_$DaySlotImpl) then) =
      __$$DaySlotImplCopyWithImpl<$Res>;
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
class __$$DaySlotImplCopyWithImpl<$Res>
    extends _$DaySlotCopyWithImpl<$Res, _$DaySlotImpl>
    implements _$$DaySlotImplCopyWith<$Res> {
  __$$DaySlotImplCopyWithImpl(
      _$DaySlotImpl _value, $Res Function(_$DaySlotImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? Time = freezed,
    Object? FromTime = freezed,
    Object? ToTime = freezed,
    Object? Day = freezed,
    Object? Days_Name = freezed,
    Object? Time_List = freezed,
  }) {
    return _then(_$DaySlotImpl(
      Time: freezed == Time
          ? _value.Time
          : Time // ignore: cast_nullable_to_non_nullable
              as dynamic,
      FromTime: freezed == FromTime
          ? _value.FromTime
          : FromTime // ignore: cast_nullable_to_non_nullable
              as dynamic,
      ToTime: freezed == ToTime
          ? _value.ToTime
          : ToTime // ignore: cast_nullable_to_non_nullable
              as dynamic,
      Day: freezed == Day
          ? _value._Day
          : Day // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      Days_Name: freezed == Days_Name
          ? _value.Days_Name
          : Days_Name // ignore: cast_nullable_to_non_nullable
              as dynamic,
      Time_List: freezed == Time_List
          ? _value.Time_List
          : Time_List // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DaySlotImpl implements _DaySlot {
  const _$DaySlotImpl(
      {this.Time = '',
      this.FromTime = '',
      this.ToTime = '',
      final List<String>? Day,
      this.Days_Name = '',
      this.Time_List = ''})
      : _Day = Day;

  factory _$DaySlotImpl.fromJson(Map<String, dynamic> json) =>
      _$$DaySlotImplFromJson(json);

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
    if (_Day is EqualUnmodifiableListView) return _Day;
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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DaySlotImpl &&
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
  _$$DaySlotImplCopyWith<_$DaySlotImpl> get copyWith =>
      __$$DaySlotImplCopyWithImpl<_$DaySlotImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DaySlotImplToJson(
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
      final dynamic Time_List}) = _$DaySlotImpl;

  factory _DaySlot.fromJson(Map<String, dynamic> json) = _$DaySlotImpl.fromJson;

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
  _$$DaySlotImplCopyWith<_$DaySlotImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
