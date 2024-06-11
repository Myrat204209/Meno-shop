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
    this.products,
  });
  final String? uuid;
  final String? name;
  final bool? isActive;
  final List<PhotoItem>? photo;
  final List<ProductItem>? products;
  factory SubcategoryItem.fromJson(JsonType json) =>
      _$SubcategoryItemFromJson(json);

  JsonType toJson() => _$SubcategoryItemToJson(this);
}
