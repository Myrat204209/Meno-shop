// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:data_provider/data_provider.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cart_item.g.dart';

/// CartItem model to store items in the cart
@HiveType(typeId: 1)
@JsonSerializable(explicitToJson: true)
class CartItem extends HiveObject with EquatableMixin {
  @HiveField(0)
  final String uuid;
  @HiveField(1)
  final int quantity;
  @HiveField(2)
  final String size;
  @HiveField(3)
  final String creator;
  @HiveField(4)
  @JsonKey(includeToJson: false)
  final double price;
  CartItem({
    required this.uuid,
    required this.quantity,
    required this.size,
    required this.creator,
    required this.price,
  });

  @override
  List<Object> get props {
    return [
      uuid,
      quantity,
      size,
      creator,
      price,
    ];
  }

  CartItem copyWith({
    String? uuid,
    int? quantity,
    String? size,
    String? creator,
    double? price,
  }) {
    return CartItem(
      uuid: uuid ?? this.uuid,
      quantity: quantity ?? this.quantity,
      size: size ?? this.size,
      creator: creator ?? this.creator,
      price: price ?? this.price,
    );
  }

  factory CartItem.fromJson(JsonType json) => _$CartItemFromJson(json);
  JsonType toJson() => _$CartItemToJson(this);
}
