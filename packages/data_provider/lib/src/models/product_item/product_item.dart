// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:data_provider/data_provider.dart';
import 'package:json_annotation/json_annotation.dart';
part 'product_item.g.dart';

@JsonSerializable(explicitToJson: true)
class ProductItem {
  const ProductItem({
    this.uuid,
    this.name,
    this.price,
    this.stock,
    this.description,
    this.discounts,
    this.photo,
    this.advantages,
    this.categories,
    this.subcategories,
  });
  final String? uuid;
  final String? name;
  final double? price;
  final int? stock;
  final String? description;
  final DiscountItem? discounts;
  final AdvantagesItem? advantages;
  final List<PhotoItem>? photo;
  final List<CategoryItem>? categories;
  final List<SubcategoryItem>? subcategories;

  factory ProductItem.fromJson(JsonType json) => _$ProductItemFromJson(json);
  JsonType toJson() => _$ProductItemToJson(this);
}
