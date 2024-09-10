import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_cart_item.freezed.dart';
part 'order_cart_item.g.dart';

@freezed
class OrderCartItem with _$OrderCartItem {
  const factory OrderCartItem({
  @Default(null) dynamic Cart_id,
  @Default(null) dynamic Product_id,
  @Default(null) dynamic Product_Name,
  @Default(0) int Qty,
  @Default(null) dynamic Product_mrp,
  @Default(null) dynamic Product_Price,
  @Default(null) dynamic User_id
  }) = _OrderCartItem;
  static const fromJsonFactory = _$OrderCartItemFromJson;
  factory OrderCartItem.fromJson(Map<String, dynamic> json) =>
      _$OrderCartItemFromJson(json);
}

