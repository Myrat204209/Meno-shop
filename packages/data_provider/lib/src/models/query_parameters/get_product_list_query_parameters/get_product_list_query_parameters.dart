import 'package:data_provider/data_provider.dart' show JsonType;
import 'package:json_annotation/json_annotation.dart';
part 'get_product_list_query_parameters.g.dart';

enum FilterEnum { name, description, price, stock, updatedAt }

enum SortEnum { ASC, DESC }

// Populate:categories,subcategories

@JsonSerializable(explicitToJson: true)
class GetProductListQueryParameters {
  @JsonKey(includeIfNull: false)
  final int? offset;
  @JsonKey(includeIfNull: false)
  final int? limit;
  @JsonKey(includeIfNull: false)
  final SortEnum? sort;
  @JsonKey(includeIfNull: false)
  final FilterEnum? filter;
  @JsonKey(includeIfNull: false)
  final List<String>? attributes;
  @JsonKey(includeIfNull: false)
  final List<String>? populate;

  GetProductListQueryParameters({
    this.offset,
    this.limit,
    this.sort,
    this.filter,
    this.attributes,
    this.populate,
  });

  JsonType toJson() => _$GetProductListQueryParametersToJson(this);
  factory GetProductListQueryParameters.fromJson(JsonType json) =>
      _$GetProductListQueryParametersFromJson(json);
}