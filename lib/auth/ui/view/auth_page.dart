import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:meno_shop/auth/auth.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  static Route<void> route() =>
      MaterialPageRoute<void>(builder: (_) => const AuthPage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Icon(
            Icons.phone,
            size: 100,
          ),
          Text(
            'Telefon belginizi girizin!',
            style: const AppTextStyle.text().xxl().bold(),
          ),
          Text(
            'Biz sizin telefon belginize OTP kodyny \nugradarys!',
            softWrap: true,
            textAlign: TextAlign.center,
            style: const AppTextStyle.text()
                .xs()
                .regular()
                .withColor(const Color(0xFF8F8F8F)),
          ),
          const SizedBox(height: AppSpacing.xxxlg),
          const LoginView(),
        ],
      ).paddingSymmetric(vertical: 50, horizontal: 5),
    );
  }
}
