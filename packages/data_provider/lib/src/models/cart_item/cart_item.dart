// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'cart_item.g.dart';

/// CartItem model to store items in the cart
@HiveType(typeId: 1)
class CartItem extends HiveObject with EquatableMixin {
  @HiveField(0)
  final String productUuid;

  @HiveField(1)
  final int productQuantity;
  @HiveField(2)
  final String filter; 

  CartItem({
    required this.productUuid,
    required this.productQuantity,
    required this.filter,
  });

  @override
  List<Object> get props => [productUuid, productQuantity, filter,];

  CartItem copyWith({
    String? productUuid,
    int? productQuantity,
    String? filter,
  }) {
    return CartItem(
      productUuid: productUuid ?? this.productUuid,
      productQuantity: productQuantity ?? this.productQuantity,
      filter: filter ?? this.filter,
    );
  }
}
