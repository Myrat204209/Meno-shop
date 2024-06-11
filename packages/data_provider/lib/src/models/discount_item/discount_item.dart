import 'package:data_provider/data_provider.dart';
import 'package:json_annotation/json_annotation.dart';

part 'discount_item.g.dart';

@JsonSerializable(explicitToJson: true)
class DiscountItem {
  DiscountItem({
    this.uuid,
    this.fastDelivery,
    this.freeDelivery,
    this.oneToOne,
    this.twoToOne,
    this.oneToGift,
    this.pay_online,
    this.pay_money,
    this.advantageProduct,
    this.discount,
  });
  final String? uuid;
  final bool? fastDelivery;
  final bool? freeDelivery;
  final bool? oneToOne;
  final bool? twoToOne;
  final bool? oneToGift;
  final bool? pay_online;
  final bool? pay_money;
  final int? advantageProduct;
  final double? discount;

  factory DiscountItem.fromJson(JsonType json) => _$DiscountItemFromJson(json);

  JsonType toJson() => _$DiscountItemToJson(this);
}
