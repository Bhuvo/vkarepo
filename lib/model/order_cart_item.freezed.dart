// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_cart_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OrderCartItem _$OrderCartItemFromJson(Map<String, dynamic> json) {
  return _OrderCartItem.fromJson(json);
}

/// @nodoc
mixin _$OrderCartItem {
  dynamic get Cart_id => throw _privateConstructorUsedError;
  dynamic get Product_id => throw _privateConstructorUsedError;
  dynamic get Product_Name => throw _privateConstructorUsedError;
  int get Qty => throw _privateConstructorUsedError;
  dynamic get Product_mrp => throw _privateConstructorUsedError;
  dynamic get Product_Price => throw _privateConstructorUsedError;
  dynamic get User_id => throw _privateConstructorUsedError;

  /// Serializes this OrderCartItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderCartItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderCartItemCopyWith<OrderCartItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderCartItemCopyWith<$Res> {
  factory $OrderCartItemCopyWith(
          OrderCartItem value, $Res Function(OrderCartItem) then) =
      _$OrderCartItemCopyWithImpl<$Res, OrderCartItem>;
  @useResult
  $Res call(
      {dynamic Cart_id,
      dynamic Product_id,
      dynamic Product_Name,
      int Qty,
      dynamic Product_mrp,
      dynamic Product_Price,
      dynamic User_id});
}

/// @nodoc
class _$OrderCartItemCopyWithImpl<$Res, $Val extends OrderCartItem>
    implements $OrderCartItemCopyWith<$Res> {
  _$OrderCartItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderCartItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? Cart_id = freezed,
    Object? Product_id = freezed,
    Object? Product_Name = freezed,
    Object? Qty = null,
    Object? Product_mrp = freezed,
    Object? Product_Price = freezed,
    Object? User_id = freezed,
  }) {
    return _then(_value.copyWith(
      Cart_id: freezed == Cart_id
          ? _value.Cart_id
          : Cart_id // ignore: cast_nullable_to_non_nullable
              as dynamic,
      Product_id: freezed == Product_id
          ? _value.Product_id
          : Product_id // ignore: cast_nullable_to_non_nullable
              as dynamic,
      Product_Name: freezed == Product_Name
          ? _value.Product_Name
          : Product_Name // ignore: cast_nullable_to_non_nullable
              as dynamic,
      Qty: null == Qty
          ? _value.Qty
          : Qty // ignore: cast_nullable_to_non_nullable
              as int,
      Product_mrp: freezed == Product_mrp
          ? _value.Product_mrp
          : Product_mrp // ignore: cast_nullable_to_non_nullable
              as dynamic,
      Product_Price: freezed == Product_Price
          ? _value.Product_Price
          : Product_Price // ignore: cast_nullable_to_non_nullable
              as dynamic,
      User_id: freezed == User_id
          ? _value.User_id
          : User_id // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderCartItemImplCopyWith<$Res>
    implements $OrderCartItemCopyWith<$Res> {
  factory _$$OrderCartItemImplCopyWith(
          _$OrderCartItemImpl value, $Res Function(_$OrderCartItemImpl) then) =
      __$$OrderCartItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {dynamic Cart_id,
      dynamic Product_id,
      dynamic Product_Name,
      int Qty,
      dynamic Product_mrp,
      dynamic Product_Price,
      dynamic User_id});
}

/// @nodoc
class __$$OrderCartItemImplCopyWithImpl<$Res>
    extends _$OrderCartItemCopyWithImpl<$Res, _$OrderCartItemImpl>
    implements _$$OrderCartItemImplCopyWith<$Res> {
  __$$OrderCartItemImplCopyWithImpl(
      _$OrderCartItemImpl _value, $Res Function(_$OrderCartItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderCartItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? Cart_id = freezed,
    Object? Product_id = freezed,
    Object? Product_Name = freezed,
    Object? Qty = null,
    Object? Product_mrp = freezed,
    Object? Product_Price = freezed,
    Object? User_id = freezed,
  }) {
    return _then(_$OrderCartItemImpl(
      Cart_id: freezed == Cart_id
          ? _value.Cart_id
          : Cart_id // ignore: cast_nullable_to_non_nullable
              as dynamic,
      Product_id: freezed == Product_id
          ? _value.Product_id
          : Product_id // ignore: cast_nullable_to_non_nullable
              as dynamic,
      Product_Name: freezed == Product_Name
          ? _value.Product_Name
          : Product_Name // ignore: cast_nullable_to_non_nullable
              as dynamic,
      Qty: null == Qty
          ? _value.Qty
          : Qty // ignore: cast_nullable_to_non_nullable
              as int,
      Product_mrp: freezed == Product_mrp
          ? _value.Product_mrp
          : Product_mrp // ignore: cast_nullable_to_non_nullable
              as dynamic,
      Product_Price: freezed == Product_Price
          ? _value.Product_Price
          : Product_Price // ignore: cast_nullable_to_non_nullable
              as dynamic,
      User_id: freezed == User_id
          ? _value.User_id
          : User_id // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderCartItemImpl implements _OrderCartItem {
  const _$OrderCartItemImpl(
      {this.Cart_id = null,
      this.Product_id = null,
      this.Product_Name = null,
      this.Qty = 0,
      this.Product_mrp = null,
      this.Product_Price = null,
      this.User_id = null});

  factory _$OrderCartItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderCartItemImplFromJson(json);

  @override
  @JsonKey()
  final dynamic Cart_id;
  @override
  @JsonKey()
  final dynamic Product_id;
  @override
  @JsonKey()
  final dynamic Product_Name;
  @override
  @JsonKey()
  final int Qty;
  @override
  @JsonKey()
  final dynamic Product_mrp;
  @override
  @JsonKey()
  final dynamic Product_Price;
  @override
  @JsonKey()
  final dynamic User_id;

  @override
  String toString() {
    return 'OrderCartItem(Cart_id: $Cart_id, Product_id: $Product_id, Product_Name: $Product_Name, Qty: $Qty, Product_mrp: $Product_mrp, Product_Price: $Product_Price, User_id: $User_id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderCartItemImpl &&
            const DeepCollectionEquality().equals(other.Cart_id, Cart_id) &&
            const DeepCollectionEquality()
                .equals(other.Product_id, Product_id) &&
            const DeepCollectionEquality()
                .equals(other.Product_Name, Product_Name) &&
            (identical(other.Qty, Qty) || other.Qty == Qty) &&
            const DeepCollectionEquality()
                .equals(other.Product_mrp, Product_mrp) &&
            const DeepCollectionEquality()
                .equals(other.Product_Price, Product_Price) &&
            const DeepCollectionEquality().equals(other.User_id, User_id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(Cart_id),
      const DeepCollectionEquality().hash(Product_id),
      const DeepCollectionEquality().hash(Product_Name),
      Qty,
      const DeepCollectionEquality().hash(Product_mrp),
      const DeepCollectionEquality().hash(Product_Price),
      const DeepCollectionEquality().hash(User_id));

  /// Create a copy of OrderCartItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderCartItemImplCopyWith<_$OrderCartItemImpl> get copyWith =>
      __$$OrderCartItemImplCopyWithImpl<_$OrderCartItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderCartItemImplToJson(
      this,
    );
  }
}

abstract class _OrderCartItem implements OrderCartItem {
  const factory _OrderCartItem(
      {final dynamic Cart_id,
      final dynamic Product_id,
      final dynamic Product_Name,
      final int Qty,
      final dynamic Product_mrp,
      final dynamic Product_Price,
      final dynamic User_id}) = _$OrderCartItemImpl;

  factory _OrderCartItem.fromJson(Map<String, dynamic> json) =
      _$OrderCartItemImpl.fromJson;

  @override
  dynamic get Cart_id;
  @override
  dynamic get Product_id;
  @override
  dynamic get Product_Name;
  @override
  int get Qty;
  @override
  dynamic get Product_mrp;
  @override
  dynamic get Product_Price;
  @override
  dynamic get User_id;

  /// Create a copy of OrderCartItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderCartItemImplCopyWith<_$OrderCartItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
