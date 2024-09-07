// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:data_provider/data_provider.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category_item.g.dart';

@JsonSerializable(explicitToJson: true)
class CategoryItem {
  CategoryItem({
    this.uuid,
    this.name,
    this.description,
    this.isActive,
    this.creator,
    this.photo,
    this.products,
    this.subcategories,
  });
  final String? uuid;
  final LanguageModel? name;
  final LanguageModel? description;
  final bool? isActive;
  final CreatorItem? creator;
  final PhotoItem? photo;
  final List<ProductItem>? products;
  final List<SubcategoryItem>? subcategories;
  JsonType toJson() => _$CategoryItemToJson(this);
  factory CategoryItem.fromJson(JsonType json) => _$CategoryItemFromJson(json);
}
