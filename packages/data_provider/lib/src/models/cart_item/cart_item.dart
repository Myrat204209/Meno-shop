// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'cart_item.g.dart';

@HiveType(typeId: 2)
class CartItem extends Equatable with HiveObjectMixin {
  @HiveField(0)
  final String productId;
  @HiveField(1)
  final int quantity;

  CartItem({
    required this.productId,
    required this.quantity,
  });

  CartItem copyWith({
    String? productId,
    int? quantity,
  }) {
    return CartItem(
      productId: productId ?? this.productId,
      quantity: quantity ?? this.quantity,
    );
  }

  @override
  List<Object?> get props => [
        productId,
        quantity,
      ];
}
