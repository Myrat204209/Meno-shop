// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:meno_shop/app/app.dart';
import 'package:meno_shop/l10n/l10n.dart';
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
                    context.l10n.otpEnter,
                    style: const AppTextStyle.text().xxl().bold(),
                  ).centralize(),
                  Text(
                    context.l10n.otpSentInformation(phone),
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
            TextButton(
              onPressed: () {
                context.read<AuthBloc>().add(
                      AuthSendOtpRequested(phone: phone),
                    );
              },
              child: Text(
                context.l10n.otpEnter + context.l10n.sendAgain,
              ),
            ).paddingSymmetric(vertical: 10),

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
          ],
        );
      },
    ).paddingSymmetric(horizontal: 10);
  }
}
