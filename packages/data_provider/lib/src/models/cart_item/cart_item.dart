import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'cart_item.g.dart';

/// CartItem model to store items in the cart
@HiveType(typeId: 2)
class CartItem extends Equatable with HiveObjectMixin {
  @HiveField(0)
  final String uuid;

  @HiveField(1)
  final String productName;

  @HiveField(2)
  final int quantity;

  @HiveField(3)
  final double price;

  @HiveField(4)
  final double totalPrice;

  CartItem({
    required this.uuid,
    required this.productName,
    required this.quantity,
    required this.price,
  }) : totalPrice = quantity * price;

  @override
  List<Object?> get props => [
        uuid,
        productName,
        quantity,
        price,
        totalPrice,
      ];

  CartItem copyWith({
    String? uuid,
    String? productName,
    int? quantity,
    double? price,
    double? totalPrice,
  }) {
    return CartItem(
      uuid: uuid ?? this.uuid,
      productName: productName ?? this.productName,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
    );
  }
}
