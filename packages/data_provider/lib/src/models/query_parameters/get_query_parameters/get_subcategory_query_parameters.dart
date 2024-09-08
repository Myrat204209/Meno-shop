// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:data_provider/data_provider.dart' show JsonType;
import 'package:json_annotation/json_annotation.dart';

part 'get_subcategory_query_parameters.g.dart';

@JsonSerializable(explicitToJson: true)
class GetSubcategoryQueryParameters {
  @JsonKey(includeIfNull: false, defaultValue: 0)
  final int? offset;
  @JsonKey(includeIfNull: false)
  final int? limit;
  @JsonKey(includeIfNull: false)
  final String? sortBy;
  @JsonKey(includeIfNull: false)
  final String? sortAs;
  // @JsonKey(includeIfNull: false)
  // final List<String>? attributes;
  @JsonKey(includeIfNull: false)
  final List<String>? populate;
  @JsonKey(includeIfNull: false)
  final String? search;
  @JsonKey(includeIfNull: false)
  final String? input;
  @JsonKey(includeIfNull: false)
  final bool? hasProduct;
  GetSubcategoryQueryParameters({
    // this.attributes,
    this.offset,
    this.limit,
    this.sortBy,
    this.sortAs,
    this.populate,
    this.search,
    this.input,
    this.hasProduct,
  });

  factory GetSubcategoryQueryParameters.fromJson(JsonType json) =>
      _$GetSubcategoryQueryParametersFromJson(json);
  JsonType toJson() => _$GetSubcategoryQueryParametersToJson(this);
}
