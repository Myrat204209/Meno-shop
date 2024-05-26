import 'package:data_provider/data_provider.dart' show JsonType;
import 'package:json_annotation/json_annotation.dart';
part 'category_item.g.dart';

@JsonSerializable(explicitToJson: true)
class CategoryItem {
  CategoryItem({
    this.id,
    this.name,
    this.image,
  });
  final String? id;
  final String? name;
  final String? image;
  JsonType toJson() => _$CategoryItemToJson(this);
  factory CategoryItem.fromJson(JsonType json) => _$CategoryItemFromJson(json);
}
