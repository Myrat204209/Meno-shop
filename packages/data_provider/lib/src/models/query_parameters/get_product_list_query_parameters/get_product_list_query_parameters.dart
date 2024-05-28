import 'package:data_provider/data_provider.dart' show JsonType;
import 'package:json_annotation/json_annotation.dart';
part 'get_product_list_query_parameters.g.dart';

@JsonSerializable(explicitToJson: true)
class GetProductListQueryParameters {
  @JsonKey(name: 'category', includeIfNull: false)
  final String? categoryId;
  @JsonKey(name: 'brands', includeIfNull: false)
  final String? brandId;
  @JsonKey(includeIfNull: false)
  final String? page;
  @JsonKey(includeIfNull: false)
  final String? limit;
  @JsonKey(name: 'keyword', includeIfNull: false)
  final String? search;

  GetProductListQueryParameters({
    this.categoryId,
    this.brandId,
    this.page,
    this.limit,
    this.search,
  });
  JsonType toJson() => _$GetProductListQueryParametersToJson(this);
  factory GetProductListQueryParameters.fromJson(JsonType json) =>
      _$GetProductListQueryParametersFromJson(json);
}
