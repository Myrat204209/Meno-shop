// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:data_provider/data_provider.dart' show JsonType;
import 'package:json_annotation/json_annotation.dart';

part 'get_category_query_parameters.g.dart';

@JsonSerializable(explicitToJson: true)
class GetCategoryQueryParameters {
  @JsonKey(includeIfNull: false, defaultValue: 0)
  final int? offset;
  @JsonKey(includeIfNull: false)
  final int? limit;
  @JsonKey(includeIfNull: false)
  final String? sortBy;
  @JsonKey(includeIfNull: false)
  final String? sortAs;
  @JsonKey(includeIfNull: false)
  final List<String>? attributes;
  @JsonKey(includeIfNull: false)
  final List<String>? populate;
  @JsonKey(includeIfNull: false)
  final String? search;
  @JsonKey(includeIfNull: false)
  final bool? isActive;
  @JsonKey(includeIfNull: false)
  final bool? input;

  factory GetCategoryQueryParameters.fromJson(JsonType json) =>
      _$GetCategoryQueryParametersFromJson(json);

  GetCategoryQueryParameters({
    this.offset,
    this.limit,
    this.sortBy,
    this.sortAs,
    this.attributes,
    this.populate,
    this.search,
    this.isActive,
    this.input,
  });
  JsonType toJson() => _$GetCategoryQueryParametersToJson(this);
}
