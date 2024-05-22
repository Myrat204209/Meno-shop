import 'package:json_annotation/json_annotation.dart';
part 'product_item.g.dart';

@JsonSerializable(explicitToJson: true)
class ProductItem {
  final String? id;
  final String? name;
  final String? description;
  final String? image;
  final double? price;
  final int? count;
  final String? rating;
  final double? discount;
  final double? discountedPrice;

  ProductItem({
    this.id,
    this.name,
    this.description,
    this.image,
    this.price,
    this.count,
    this.rating,
    this.discount,
    this.discountedPrice,
  });
  Map<String, dynamic> toJson() => _$ProductItemToJson(this);
  factory ProductItem.fromJson(Map<String, dynamic> json) =>
      _$ProductItemFromJson(json);
}
