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
  @HiveField(5)
  @JsonKey(includeToJson: false)
  final String nameTk;
  @HiveField(6)
  @JsonKey(includeToJson: false)
  final String nameRu;
  @HiveField(7)
  @JsonKey(includeToJson: false)
  final String photoPath;
  CartItem({
    required this.uuid,
    required this.quantity,
    required this.size,
    required this.creator,
    required this.price,
    required this.nameTk,
    required this.nameRu,
    required this.photoPath,
  });
  CartItem.initial({
    required this.uuid,
    this.quantity = 1,
    this.size = '',
    required this.creator,
    required this.price,
    required this.nameRu,
    required this.nameTk,
    required this.photoPath,
  });
  @override
  List<Object> get props {
    return [
      uuid,
      quantity,
      size,
      creator,
      price,
      nameTk,
      nameRu,
      photoPath,
    ];
  }

  CartItem copyWith({
    String? uuid,
    int? quantity,
    String? size,
    String? creator,
    double? price,
    String? nameTk,
    String? nameRu,
    String? photoPath,
  }) {
    return CartItem(
      uuid: uuid ?? this.uuid,
      quantity: quantity ?? this.quantity,
      size: size ?? this.size,
      creator: creator ?? this.creator,
      price: price ?? this.price,
      nameTk: nameTk ?? this.nameTk,
      nameRu: nameRu ?? this.nameRu,
      photoPath: photoPath ?? this.photoPath,
    );
  }

  factory CartItem.fromJson(JsonType json) => _$CartItemFromJson(json);
  JsonType toJson() => _$CartItemToJson(this);

  @override
  String toString() {
    return '''
    CartItem:
    - uuid: ${uuid.isEmpty ? 'NULL' : uuid}
    - quantity: $quantity
    - size: ${size.isEmpty ? 'NULL' : size}
    - creator: ${creator.isEmpty ? 'NULL' : creator}
    - price: $price
    - nameTk: ${nameTk.isEmpty ? 'NULL' : nameTk}
    - nameRu: ${nameRu.isEmpty ? 'NULL' : nameRu}
    - photoPath: ${photoPath.isEmpty ? 'NULL' : photoPath}
    ''';
  }
}
