// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:data_provider/data_provider.dart';
import 'package:json_annotation/json_annotation.dart';

part 'subcategory_item.g.dart';

@JsonSerializable(explicitToJson: true)
class SubcategoryItem {
  const SubcategoryItem({
    this.uuid,
    this.name,
    this.isActive,
    this.photo,
    this.creator,
    this.category,
    this.products,
  });
  final String? uuid;
  final LanguageModel? name;
  final bool? isActive;
  final PhotoItem? photo;
  final CreatorItem? creator;
  final CategoryItem? category;
  final List<ProductItem>? products;
  factory SubcategoryItem.fromJson(JsonType json) =>
      _$SubcategoryItemFromJson(json);

  JsonType toJson() => _$SubcategoryItemToJson(this);
}
