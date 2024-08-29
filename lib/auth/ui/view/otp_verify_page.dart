// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:meno_shop/auth/auth.dart';

class OtpVerifyPage extends StatelessWidget {
  const OtpVerifyPage({
    super.key,
    required this.phone,
  });

  final String phone;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OtpVerifyContent(phone: phone),
    );
  }
}
