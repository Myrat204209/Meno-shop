// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:meno_shop/app/app.dart';
import 'package:meno_shop/l10n/l10n.dart';

import 'package:meno_shop/auth/auth.dart';

class OtpVerifyContent extends HookWidget {
  const OtpVerifyContent({
    super.key,
    required this.phone,
  });
  final String phone;
  @override
  Widget build(BuildContext context) {
    final formKey = useMemoized(() => GlobalKey<FormState>());

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.57,
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return Column(
            children: [
              Form(
                key: formKey,
                child: ListView(
                  shrinkWrap: true,
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding:
                      const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                  children: [
                    Text(
                      context.l10n.otpEnter,
                      style: const AppTextStyle.text().xxl().bold(),
                    ).centralize().paddingOnly(bottom: 5),
                    Text(
                      context.l10n.otpSentInformation(phone),
                      softWrap: true,
                      textAlign: TextAlign.center,
                      style: const AppTextStyle.text()
                          .xs()
                          .regular()
                          .withColor(const Color(0xFF8F8F8F)),
                    ).centralize(),
                    const SizedBox(height: AppSpacing.xxlg),
                    OtpInput(
                      onSubmitPressed: (value) {
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
              Text(
                Timer(const Duration(seconds: 3), () {}).tick.toString(),
              ),

              TextButton(
                onPressed: () => context.read<AuthBloc>().add(
                      AuthSendOtpRequested(phone: phone),
                    ),
                child: Text(context.l10n.otpEnter + context.l10n.sendAgain),
              ).paddingSymmetric(vertical: 10),

              /// Next button
              AppButton(
                onTap: () => context.replaceNamed(RouteNames.home.name),
                buttonText: context.l10n.ok,
                color: AppColors.secondary,
                textColor: AppColors.quaterniary,
              ).paddingSymmetric(horizontal: 5),
            ],
          );
        },
      ),
    );
  }
}
