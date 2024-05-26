// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:data_provider/data_provider.dart' show JsonType;
import 'package:json_annotation/json_annotation.dart';

part 'auth_otp_body.g.dart';

/// Auth Otp Body
@JsonSerializable(explicitToJson: true)
class AuthOtpBody {
  final String phoneNumber;
  final String otpCode;
  AuthOtpBody({
    required this.phoneNumber,
    required this.otpCode,
  });
  factory AuthOtpBody.fromJson(JsonType json) => _$AuthOtpBodyFromJson(json);
  JsonType toJson() => _$AuthOtpBodyToJson(this);
}
