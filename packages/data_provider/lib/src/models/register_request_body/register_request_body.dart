import 'package:json_annotation/json_annotation.dart';
import 'package:data_provider/data_provider.dart' show JsonType;

part 'register_request_body.g.dart';

@JsonSerializable(explicitToJson: true)
class RegisterRequestBody {
  final String? phone;

  RegisterRequestBody({this.phone});
  JsonType toJson() => _$RegisterRequestBodyToJson(this);
  factory RegisterRequestBody.fromJson(JsonType json) =>
      _$RegisterRequestBodyFromJson(json);
}
