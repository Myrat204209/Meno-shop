import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:meno_shop/auth/auth.dart';

class OtpVerifyContent extends StatelessWidget {
  const OtpVerifyContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(AppSpacing.md),
      children: const [
        /// Phone number
        PhoneInput(
          readOnly: true,
          initialValue: "64530230",
        ),

        SizedBox(height: AppSpacing.md),

        /// Otp code input
        OtpCodeInput(),

        SizedBox(height: AppSpacing.md),
      ],
    );
  }
}
