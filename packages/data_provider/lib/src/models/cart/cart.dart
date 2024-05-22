import 'package:data_provider/data_provider.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cart.g.dart';

@JsonSerializable(explicitToJson: true)
class CartResponse {
  final Cart? data;

  CartResponse({this.data});
  Map<String, dynamic> toJson() => _$CartResponseToJson(this);
  factory CartResponse.fromJson(Map<String, dynamic> json) =>
      _$CartResponseFromJson(json);
}

@JsonSerializable(explicitToJson: true)
class Cart {
  final double? totalPrice;
  final int? quantity;
  final List<CartItem>? items;

  Cart({
    this.totalPrice,
    this.quantity,
    this.items,
  });
  Map<String, dynamic> toJson() => _$CartToJson(this);
  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);
}

@JsonSerializable(explicitToJson: true)
class CartItem {
  final String? id;
  final String? productId;
  final double? totalPrice;
  final int? quantity;
  final ProductItem? product;

  CartItem({
    this.id,
    this.productId,
    this.totalPrice,
    this.quantity,
    this.product,
  });
  Map<String, dynamic> toJson() => _$CartItemToJson(this);
  factory CartItem.fromJson(Map<String, dynamic> json) =>
      _$CartItemFromJson(json);
}
