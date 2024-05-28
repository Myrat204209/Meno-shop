import 'package:data_provider/data_provider.dart' show ProductItem, JsonType;
import 'package:json_annotation/json_annotation.dart';
part 'product_list_response.g.dart';

@JsonSerializable(explicitToJson: true)
class ProductListResponse {
  final int? currentPage;
  final int? from;
  final int? to;
  final dynamic perpage;
  final List<ProductItem>? data;

  ProductListResponse({
    this.currentPage,
    this.from,
    this.to,
    this.perpage,
    this.data,
  });
  JsonType toJson() => _$ProductListResponseToJson(this);
  factory ProductListResponse.fromJson(JsonType json) =>
      _$ProductListResponseFromJson(json);
}
