import 'package:data_provider/data_provider.dart' show JsonType;
import 'package:json_annotation/json_annotation.dart';
part 'get_product_query_parameters.g.dart';

@JsonSerializable(explicitToJson: true)
class GetProductQueryParameters {
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

  GetProductQueryParameters({
    this.offset,
    this.limit,
    this.sortBy,
    this.sortAs,
    this.attributes,
    this.populate,
    this.search,
  });
  JsonType toJson() => _$GetProductQueryParametersToJson(this);
  factory GetProductQueryParameters.fromJson(JsonType json) =>
      _$GetProductQueryParametersFromJson(json);
}