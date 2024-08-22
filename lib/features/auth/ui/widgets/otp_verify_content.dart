import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meno_shop/features/auth/auth.dart';
import 'package:pinput/pinput.dart';

class OtpVerifyContent extends StatelessWidget {
  const OtpVerifyContent({super.key});

  @override
  Widget build(BuildContext context) {
    final phone = context.select((LoginBloc bloc) => bloc.state.phone);
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(AppSpacing.md),
      children: [
        /// Phone number
        PhoneInput(
          readOnly: true,
          initialValue: phone.value,
        ),

        const SizedBox(height: AppSpacing.md),

        /// Otp code input
        const Pinput(
          length: 5,
        ),

        const SizedBox(height: AppSpacing.md),
      ],
    );
  }
}
