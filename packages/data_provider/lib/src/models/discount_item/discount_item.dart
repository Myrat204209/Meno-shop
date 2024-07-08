// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:data_provider/data_provider.dart';
import 'package:json_annotation/json_annotation.dart';

part 'discount_item.g.dart';

@JsonSerializable(explicitToJson: true)
class DiscountItem {
  DiscountItem({
    this.uuid,
    this.productId,
    this.originalPrice,
    this.discountedPrice,
    this.percentage,
  });
  final String? uuid;
  final String? productId;
  final double? originalPrice;
  final double? discountedPrice;
  final int? percentage;

  factory DiscountItem.fromJson(JsonType json) => _$DiscountItemFromJson(json);

  JsonType toJson() => _$DiscountItemToJson(this);
}
