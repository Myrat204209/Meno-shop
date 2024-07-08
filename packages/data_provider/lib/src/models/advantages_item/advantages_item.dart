import 'package:data_provider/data_provider.dart';
import 'package:json_annotation/json_annotation.dart';

part 'advantages_item.g.dart';

@JsonSerializable(explicitToJson: true)
class AdvantagesItem {
  const AdvantagesItem({
    this.uuid,
    this.fastDelivery,
    this.productId,
    this.freeDelivery,
    this.oneToOne,
    this.twoToOne,
    this.oneToGift,
    this.advantageProduct,
    this.payOnline,
    this.payTerminal,
  });
  final String? uuid;
  final bool? fastDelivery;
  final bool? freeDelivery;
  final bool? oneToOne;
  final bool? twoToOne;
  final bool? oneToGift;
  final bool? payOnline;
  final String? productId;
  final bool? payTerminal;
  final int? advantageProduct;

  factory AdvantagesItem.fromJson(JsonType json) =>
      _$AdvantagesItemFromJson(json);
  JsonType toJson() => _$AdvantagesItemToJson(this);
}
