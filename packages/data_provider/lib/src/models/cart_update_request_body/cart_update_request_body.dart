import 'package:json_annotation/json_annotation.dart';

part 'cart_update_request_body.g.dart';

@JsonSerializable(explicitToJson: true)
class CartUpdateRequestBody {
  final String? productId;
  final int? quantity;

  CartUpdateRequestBody({
    this.productId,
    this.quantity,
  });
  Map<String, dynamic> toJson() => _$CartUpdateRequestBodyToJson(this);
  factory CartUpdateRequestBody.fromJson(Map<String, dynamic> json) =>
      _$CartUpdateRequestBodyFromJson(json);
}
