import 'package:data_provider/data_provider.dart' show JsonType;
import 'package:json_annotation/json_annotation.dart';
part 'get_query_parameters.g.dart';

enum FilterEnum {
  categoryId,
  name,
  description,
  isActive,
  price,
  stock,
  updatedAt,
}

enum SortEnum { ASC, DESC }

// Populate:categories,subcategories

@JsonSerializable(explicitToJson: true)
class GetQueryParameters {
  @JsonKey(includeIfNull: false, defaultValue: 0)
  final int? offset;
  @JsonKey(includeIfNull: false)
  final int? limit;
  @JsonKey(includeIfNull: false)
  final String? sort;
  @JsonKey(includeIfNull: false)
  final bool? isActive;
  @JsonKey(includeIfNull: false)
  final String? filter;
  @JsonKey(includeIfNull: false)
  final List<String>? attributes;
  @JsonKey(includeIfNull: false)
  final List<String>? populate;

  GetQueryParameters({
    this.offset,
    this.limit,
    this.sort,
    this.filter,
    this.isActive,
    this.attributes,
    this.populate,
  });

  JsonType toJson() => _$GetQueryParametersToJson(this);
  factory GetQueryParameters.fromJson(JsonType json) =>
      _$GetQueryParametersFromJson(json);
}
