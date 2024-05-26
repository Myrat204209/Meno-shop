import 'package:data_provider/data_provider.dart' show JsonType, CategoryItem;
import 'package:json_annotation/json_annotation.dart';
part 'category_list_response.g.dart';

@JsonSerializable(explicitToJson: true)
class CategoryListResponse {
  CategoryListResponse(
    this.data,
  );
  final List<CategoryItem>? data;

  JsonType toJson() => _$CategoryListResponseToJson(this);
  factory CategoryListResponse.fromJson(JsonType json) =>
      _$CategoryListResponseFromJson(json);
}
