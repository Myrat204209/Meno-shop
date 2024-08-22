import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:meno_shop/features/auth/auth.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  static Route<void> route() =>
      MaterialPageRoute<void>(builder: (_) => const AuthPage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 2 * AppSpacing.xxxlg),
            Assets.auth.otpPage
                .svg(width: 120, height: 120)
                .paddingOnly(bottom: 50),
            const LoginView(),
          ],
        ).paddingSymmetric(horizontal: 5),
      ),
    );
  }
}
