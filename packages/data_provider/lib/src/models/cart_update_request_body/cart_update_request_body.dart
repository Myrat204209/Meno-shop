import 'package:json_annotation/json_annotation.dart';
import 'package:data_provider/data_provider.dart' show JsonType;
part 'cart_update_request_body.g.dart';

@JsonSerializable(explicitToJson: true)
class CartUpdateRequestBody {
  final String? productId;
  final int? quantity;

  CartUpdateRequestBody({
    this.productId,
    this.quantity,
  });
  JsonType toJson() => _$CartUpdateRequestBodyToJson(this);
  factory CartUpdateRequestBody.fromJson(JsonType json) =>
      _$CartUpdateRequestBodyFromJson(json);
}
