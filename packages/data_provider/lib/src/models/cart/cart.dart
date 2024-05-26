import 'package:data_provider/data_provider.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cart.g.dart';

@JsonSerializable(explicitToJson: true)
class CartResponse {
  final Cart? data;

  CartResponse({this.data});
  JsonType toJson() => _$CartResponseToJson(this);
  factory CartResponse.fromJson(JsonType json) => _$CartResponseFromJson(json);
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
  JsonType toJson() => _$CartToJson(this);
  factory Cart.fromJson(JsonType json) => _$CartFromJson(json);
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
  JsonType toJson() => _$CartItemToJson(this);
  factory CartItem.fromJson(JsonType json) => _$CartItemFromJson(json);
}
