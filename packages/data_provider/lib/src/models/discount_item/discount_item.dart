import 'package:data_provider/data_provider.dart';
import 'package:json_annotation/json_annotation.dart';

part 'discount_item.g.dart';

@JsonSerializable()
class DiscountItem {
  DiscountItem({
    required this.uuid,
    required this.fastDelivery,
    required this.freeDelivery,
    required this.oneToOne,
    required this.twoToOne,
    required this.oneToGift,
    required this.pay_online,
    required this.pay_money,
    required this.advantageProduct,
    required this.discount,
  });
  final String? uuid;
  final bool fastDelivery;
  final bool freeDelivery;
  final bool oneToOne;
  final bool twoToOne;
  final bool oneToGift;
  final bool pay_online;
  final bool pay_money;
  final int advantageProduct;
  final double discount;

  factory DiscountItem.fromJson(JsonType json) => _$DiscountItemFromJson(json);

  JsonType toJson() => _$DiscountItemToJson(this);
}
