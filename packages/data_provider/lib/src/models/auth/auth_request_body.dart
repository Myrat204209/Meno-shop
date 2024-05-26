// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:data_provider/data_provider.dart' show JsonType;
import 'package:json_annotation/json_annotation.dart';

part 'auth_request_body.g.dart';

/// Auth Request Body
@JsonSerializable(explicitToJson: true)
class AuthRequestBody {
  final String? phoneNumber;
  AuthRequestBody(
    this.phoneNumber,
  );
  factory AuthRequestBody.fromJson(JsonType json) =>
      _$AuthRequestBodyFromJson(json);
  JsonType toJson() => _$AuthRequestBodyToJson(this);
}
