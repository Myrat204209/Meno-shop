// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:data_provider/data_provider.dart' show JsonType;
import 'package:json_annotation/json_annotation.dart';

part 'order_create_request_body.g.dart';

@JsonSerializable(explicitToJson: true)
class OrderCreateRequestBody {
  final String? fullName;
  final String? phone;
  final String? address;
  final String? note;
  final String? paymentMethod;
  final String? deliveryType;

  OrderCreateRequestBody({

    this.fullName,
    this.phone,
    this.address,
    this.note,
    this.paymentMethod,
    this.deliveryType,
  }
  );

  factory OrderCreateRequestBody.fromJson(JsonType json) =>
      _$OrderCreateRequestBodyFromJson(json);
  JsonType toJson() => _$OrderCreateRequestBodyToJson(this);
}
