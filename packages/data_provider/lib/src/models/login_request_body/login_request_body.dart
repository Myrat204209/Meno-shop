import 'package:json_annotation/json_annotation.dart';
import 'package:data_provider/data_provider.dart' show JsonType;

part 'login_request_body.g.dart';

@JsonSerializable(explicitToJson: true)
class LoginRequestBody {
  final String? phone;

  LoginRequestBody({
    this.phone,
  });
  JsonType toJson() => _$LoginRequestBodyToJson(this);
  factory LoginRequestBody.fromJson(JsonType json) =>
      _$LoginRequestBodyFromJson(json);
}
