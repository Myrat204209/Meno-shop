// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:meno_shop/app/app.dart';
import 'package:pinput/pinput.dart';

import 'package:meno_shop/auth/auth.dart';

class OtpVerifyContent extends StatelessWidget {
  const OtpVerifyContent({
    super.key,
    required this.phone,
  });
  final String phone;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return Column(
          children: [
            Expanded(
              child: ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(AppSpacing.md),
                children: [
                  const SizedBox(height: 2 * AppSpacing.xxlg),
                  Assets.auth.otpPage
                      .svg(width: 120, height: 120)
                      .paddingOnly(bottom: 40),
                  Text(
                    'OTP kodynyzy girizin!',
                    style: const AppTextStyle.text().xxl().bold(),
                  ).centralize(),
                  Text(
                    'Biz +$phone belga OTP kodyny \ngoyberdik!',
                    softWrap: true,
                    textAlign: TextAlign.center,
                    style: const AppTextStyle.text()
                        .xs()
                        .regular()
                        .withColor(const Color(0xFF8F8F8F)),
                  ).centralize(),

                  const SizedBox(height: AppSpacing.xxxlg),

                  /// Otp code input
                  Pinput(
                    length: 5,
                    autofocus: true,
                    hapticFeedbackType: HapticFeedbackType.vibrate,
                    onSubmitted: (value) {
                      context.read<AuthBloc>().add(
                            AuthCheckOtpRequested(
                              phone: phone,
                              otp: value,
                            ),
                          );
                    },
                  ),

                  const SizedBox(height: AppSpacing.md),
                ],
              ),
            ),
            const Text('Kod gelmedi. Tazeden ugrat')
                .paddingSymmetric(vertical: 10),

            /// Next button
            NextButton(
              onPressed: () {
                context.replaceNamed(RouteNames.home.name);

                // if (formKey.currentState?.validate() ?? false) {
                //   if (isPrivate) {
                //     log('----------------Validating to OTP');
                //     context.read<LoginBloc>().add(LoginPhoneSubmitted());
                //   } else {
                //     shakeKey.currentState?.shake();
                //   }
                // }
              },
            ),
            const SizedBox(height: AppSpacing.xlg),
          ],
        );
      },
    ).paddingSymmetric(horizontal: 10);
  }
}
