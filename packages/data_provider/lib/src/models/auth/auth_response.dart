// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:json_annotation/json_annotation.dart';

part 'auth_response.g.dart';

/// Auth Response
@JsonSerializable(explicitToJson: true)
class AuthResponse {
  final String? token;

  /// Access token
  AuthResponse(
    this.token,
  );
  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AuthResponseToJson(this);
}
