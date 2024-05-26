// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:json_annotation/json_annotation.dart';
import 'package:data_provider/data_provider.dart' show JsonType;

part 'auth_response.g.dart';

/// Auth Response
@JsonSerializable(explicitToJson: true)
class AuthResponse {
  final String? token;

  /// Access token
  AuthResponse(
    this.token,
  );
  factory AuthResponse.fromJson(JsonType json) => _$AuthResponseFromJson(json);
  JsonType toJson() => _$AuthResponseToJson(this);
}
