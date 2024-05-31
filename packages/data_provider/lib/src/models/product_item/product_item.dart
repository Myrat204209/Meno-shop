// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:data_provider/data_provider.dart' show JsonType;
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
  final double? discount;
  // final List<Photo>? photo;
  ProductItem({
    this.uuid,
    this.name,
    this.price,
    this.stock,
    this.description,
    this.image,
    this.rating,
    this.discount,
    // this.photo,
  });

  factory ProductItem.fromJson(JsonType json) => _$ProductItemFromJson(json);
  JsonType toJson() => _$ProductItemToJson(this);
}
