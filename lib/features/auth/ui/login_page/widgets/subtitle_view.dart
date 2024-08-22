
// SubtitleText.dart
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class SubtitleText extends StatelessWidget {
  const SubtitleText({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 100,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: 'Biz sizin telefon belginize ',
          style: const AppTextStyle.text()
              .sm()
              .regular()
              .copyWith(color: AppColors.neutral.shade500),
          children: <TextSpan>[
            TextSpan(
              text: 'OTP kodyny',
              style: const AppTextStyle.text()
                  .sm()
                  .semiBold()
                  .copyWith(color: AppColors.neutral.shade700),
            ),
            TextSpan(
              text: '  ugradarys! ',
              style: const AppTextStyle.text()
                  .sm()
                  .regular()
                  .withColor(AppColors.neutral.shade500),
            ),
          ],
        ),
      ),
    );
  }
}