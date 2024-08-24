import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class AuthPrivacyPolicyText extends StatelessWidget {
  const AuthPrivacyPolicyText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.left,
      text: TextSpan(
        text: 'Dowam etmek bilen Men',
        style:
            const AppTextStyle.text().xs().copyWith(color: AppColors.primary),
        children: <TextSpan>[
          TextSpan(
            text: ' gizlinlik syýasatyny we',
            style: const AppTextStyle.text().xs().withColor(Colors.blue),
          ),
          TextSpan(
            text: ' ulanmak düzgünlerini',
            style: const AppTextStyle.text().xs().withColor(Colors.blue),
          ),
          TextSpan(
            text: ' kabul edýärin',
            style: const AppTextStyle.text().xs().withColor(Colors.black),
          ),
        ],
      ),
    );
  }
}
