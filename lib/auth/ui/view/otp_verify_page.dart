// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 2 * AppSpacing.xxxlg),
            Assets.auth.otpPage
                .svg(width: 120, height: 120)
                .paddingOnly(bottom: 2 * AppSpacing.xxlg),
            OtpVerifyView(phone: phone),
            // LoginView(),
          ],
        ),
      ),
    );
  }
}
