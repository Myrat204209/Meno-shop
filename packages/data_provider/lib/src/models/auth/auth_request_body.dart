// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:json_annotation/json_annotation.dart';

part 'auth_request_body.g.dart';

/// Auth Request Body
@JsonSerializable(explicitToJson: true)
class AuthRequestBody {
  final String? phoneNumber;
  AuthRequestBody(
    this.phoneNumber,
  );
  factory AuthRequestBody.fromJson(Map<String, dynamic> json) =>
      _$AuthRequestBodyFromJson(json);
  Map<String, dynamic> toJson() => _$AuthRequestBodyToJson(this);
}
