// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:data_provider/data_provider.dart' show JsonType, PhotoItem;
import 'package:json_annotation/json_annotation.dart';

part 'category_item.g.dart';

@JsonSerializable(explicitToJson: true)
class CategoryItem {
  CategoryItem({
    this.uuid,
    this.name,
    this.description,
    this.photo,
  });
  final String? uuid;
  final String? name;
  final String? description;
  final List<PhotoItem>? photo;
  JsonType toJson() => _$CategoryItemToJson(this);
  factory CategoryItem.fromJson(JsonType json) => _$CategoryItemFromJson(json);
}
