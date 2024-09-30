// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_cart_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderCartItemImpl _$$OrderCartItemImplFromJson(Map<String, dynamic> json) =>
    _$OrderCartItemImpl(
      Cart_id: json['Cart_id'] ?? null,
      Product_id: json['Product_id'] ?? null,
      Product_Name: json['Product_Name'] ?? null,
      Qty: (json['Qty'] as num?)?.toInt() ?? 0,
      Product_mrp: json['Product_mrp'] ?? null,
      Product_Price: json['Product_Price'] ?? null,
      User_id: json['User_id'] ?? null,
    );

Map<String, dynamic> _$$OrderCartItemImplToJson(_$OrderCartItemImpl instance) =>
    <String, dynamic>{
      'Cart_id': instance.Cart_id,
      'Product_id': instance.Product_id,
      'Product_Name': instance.Product_Name,
      'Qty': instance.Qty,
      'Product_mrp': instance.Product_mrp,
      'Product_Price': instance.Product_Price,
      'User_id': instance.User_id,
    };
