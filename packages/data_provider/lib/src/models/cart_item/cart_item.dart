// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'cart_item.g.dart';

@HiveType(typeId: 2)
// ignore: must_be_immutable
class CartItem extends Equatable with HiveObjectMixin {
  // ignore: non_constant_identifier_names{
  @HiveField(0)
  final String id;
  @HiveField(1)
  final int quantity;

  CartItem({
    required this.id,
    required this.quantity,
  });
  CartItem copyWith({
    String? id,
    int? quantity,
  }) {
    return CartItem(
      id: id ?? this.id,
      quantity: quantity ?? this.quantity,
    );
  }

  @override
  List<Object?> get props => [
        id,
        quantity,
      ];
}
