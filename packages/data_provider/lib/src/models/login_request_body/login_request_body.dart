import 'package:json_annotation/json_annotation.dart';
part 'login_request_body.g.dart';

@JsonSerializable(explicitToJson: true)
class LoginRequestBody {
  final String? phone;

  LoginRequestBody({
    this.phone,
  });
  Map<String, dynamic> toJson() => _$LoginRequestBodyToJson(this);
  factory LoginRequestBody.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestBodyFromJson(json);
}
