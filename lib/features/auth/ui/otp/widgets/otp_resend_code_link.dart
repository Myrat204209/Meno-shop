import 'package:flutter/material.dart';
import 'package:app_ui/app_ui.dart';

class OtpResendCodeLink extends StatelessWidget {
  const OtpResendCodeLink({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        // Kod yenileme işlemi burada yapılabilir
      },
      child: RichText(
        text: TextSpan(
          text: 'Kod gelmedi. ',
          style: const AppTextStyle.text()
              .sm()
              .semiBold()
              .copyWith(color: AppColors.neutral.shade500),
          children: <TextSpan>[
            TextSpan(
              text: 'Tazeden ugrat ',
              style: const AppTextStyle.text().sm().copyWith(color: AppColors.secondary),
            ),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
