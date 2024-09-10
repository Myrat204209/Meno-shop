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
    this.sizes,
    this.creator,
    this.description,
    this.discounts,
    this.advantages,
    this.photo,
    this.categories,
    this.subcategories,
    this.subcategoryId,
  });
  final String? uuid;
  final LanguageModel? name;
  final double? price;
  final int? stock;
  final SizeItem? sizes;
  final CreatorItem? creator;
  final LanguageModel? description;
  final DiscountItem? discounts;
  final AdvantagesItem? advantages;
  final List<PhotoItem>? photo;
  final CategoryItem? categories;
  final SubcategoryItem? subcategories;
  final String? subcategoryId;
  factory ProductItem.fromJson(JsonType json) => _$ProductItemFromJson(json);
  JsonType toJson() => _$ProductItemToJson(this);

}
