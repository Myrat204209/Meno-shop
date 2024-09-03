// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:meno_shop/app/app.dart';
import 'package:meno_shop/l10n/l10n.dart';

import 'package:meno_shop/auth/auth.dart';

final verifyDescriptionStyle =
    const AppTextStyle.text().xs().regular().withColor(const Color(0xFF8F8F8F));

class OtpVerifyContent extends HookWidget {
  const OtpVerifyContent({
    super.key,
    required this.phone,
  });
  final String phone;
  @override
  Widget build(BuildContext context) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final otpController = useTextEditingController();

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.58,
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
                      style: verifyDescriptionStyle,
                    ).centralize(),
                    const SizedBox(height: AppSpacing.xxlg),
                    OtpInput(
                      controller: otpController,
                      // onSubmitPressed: (value) {
                      //   context.read<AuthBloc>().add(
                      //         AuthCheckOtpRequested(
                      //           phone: phone,
                      //           otp: value,
                      //         ),
                      // );
                      // },
                    ),
                    const SizedBox(height: AppSpacing.md),
                  ],
                ),
              ),
              const OtpTimer(),
              OtpSendAgain(onSendAgainPressed: () {
                context.read<AuthBloc>().add(
                      AuthSendOtpRequested(phone: phone),
                    );
              }),
              AppButton(
                onTap: () {
                  if (formKey.currentState?.validate() ?? false) {
                    context.replaceNamed(RouteNames.home.name);
                  }
                },
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
