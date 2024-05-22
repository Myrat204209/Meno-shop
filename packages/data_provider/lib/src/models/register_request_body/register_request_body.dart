import 'package:json_annotation/json_annotation.dart';
part 'register_request_body.g.dart';

@JsonSerializable(explicitToJson: true)
class RegisterRequestBody {
  final String? phone;

  RegisterRequestBody({this.phone});
  Map<String, dynamic> toJson() => _$RegisterRequestBodyToJson(this);
  factory RegisterRequestBody.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestBodyFromJson(json);
}
