import 'package:flutter/material.dart';
import 'package:app_ui/app_ui.dart';

class OtpPageHeader extends StatelessWidget {
  final String phoneNumber;

  const OtpPageHeader({super.key, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "OTP kodyny girizin!",
          style: const AppTextStyle.text().xl().bold(),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8.0),
        SizedBox(
          width: 300,
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: 'Biz',
              style: const AppTextStyle.text()
                  .sm()
                  .semiBold()
                  .copyWith(color: AppColors.neutral.shade500),
              children: <TextSpan>[
                TextSpan(
                  text: " +993$phoneNumber",
                  style: const AppTextStyle.text()
                      .sm()
                      .semiBold()
                      .copyWith(color: AppColors.neutral.shade700),
                ),
                TextSpan(
                  text: ' belga OTP kouny goyverdik! ',
                  style: const AppTextStyle.text()
                      .sm()
                      .semiBold()
                      .copyWith(color: AppColors.neutral.shade500),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
