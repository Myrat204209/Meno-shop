// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:data_provider/data_provider.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_item.g.dart';

@HiveType(typeId: 1)
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
    this.isFavorite,
  });
  @HiveField(0)
  final String? uuid;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final double? price;
  @HiveField(3)
  final int? stock;
  @HiveField(4, defaultValue: false)
  final bool? isFavorite;
  @HiveField(5)
  final String? description;
  @HiveField(6)
  final DiscountItem? discounts;
  @HiveField(7)
  final AdvantagesItem? advantages;
  @HiveField(8)
  final List<PhotoItem>? photo;
  @HiveField(9, defaultValue: null)
  final List<CategoryItem>? categories;
  @HiveField(10, defaultValue: null)
  final List<SubcategoryItem>? subcategories;

  factory ProductItem.fromJson(JsonType json) => _$ProductItemFromJson(json);
  JsonType toJson() => _$ProductItemToJson(this);

  ProductItem copyWith({
    String? uuid,
    String? name,
    double? price,
    int? stock,
    bool? isFavorite,
    String? description,
    DiscountItem? discounts,
    AdvantagesItem? advantages,
    List<PhotoItem>? photo,
    List<CategoryItem>? categories,
    List<SubcategoryItem>? subcategories,
  }) {
    return ProductItem(
      uuid: uuid ?? this.uuid,
      name: name ?? this.name,
      price: price ?? this.price,
      stock: stock ?? this.stock,
      isFavorite: isFavorite ?? this.isFavorite,
      description: description ?? this.description,
      discounts: discounts ?? this.discounts,
      advantages: advantages ?? this.advantages,
      photo: photo ?? this.photo,
      categories: categories ?? this.categories,
      subcategories: subcategories ?? this.subcategories,
    );
  }
}
