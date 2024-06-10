// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:data_provider/data_provider.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_item.g.dart';

@JsonSerializable(explicitToJson: true)
class ProductItem {
  final String? uuid;
  final String? name;
  final double? price;
  final int? stock;
  final String? description;
  final String? image;
  final String? rating;
  final List<PhotoItem>? photo;
  final List<DiscountItem>? discounts;
  final List<CategoryItem>? categories;
  ProductItem({
    // this.photo,
    this.uuid,
    this.name,
    this.price,
    this.stock,
    this.description,
    this.image,
    this.rating,
    this.photo,
    this.discounts,
    this.categories,
  });

  factory ProductItem.fromJson(JsonType json) => _$ProductItemFromJson(json);
  JsonType toJson() => _$ProductItemToJson(this);
}
