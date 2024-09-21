import 'package:data_provider/data_provider.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_item.g.dart';

@JsonSerializable(explicitToJson: true)
class OrderItem {
  final List<CartItem>? products;
  final String? address;
  final String? notes;

  const OrderItem({
    this.products,
    this.address,
    this.notes,
  });
  factory OrderItem.fromJson(JsonType json) => _$OrderItemFromJson(json);

  JsonType toJson() => _$OrderItemToJson(this);
}
