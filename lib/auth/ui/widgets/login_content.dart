import 'dart:developer';

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_shakemywidget/flutter_shakemywidget.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:meno_shop/auth/auth.dart';
import 'package:meno_shop/l10n/l10n.dart';

class LoginContent extends HookWidget {
  const LoginContent({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = useMemoized(() => GlobalKey<FormState>());

    final shakeKey = useMemoized(() => GlobalKey<ShakeWidgetState>());
    final checkBoxKey = useState(false);

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.58,
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          final readOnly = state.status.isInProgress;

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
                      context.l10n.phoneInput,
                      style: const AppTextStyle.text().xxl().bold(),
                    ).centralize().paddingOnly(bottom: 5),
                    Text(
                      context.l10n.otpSending,
                      softWrap: true,
                      textAlign: TextAlign.center,
                      style: const AppTextStyle.text()
                          .xs()
                          .regular()
                          .withColor(const Color(0xFF8F8F8F)),
                    ).centralize(),
                    const SizedBox(height: AppSpacing.xxlg),
                    PhoneInput(
                      readOnly: readOnly,
                      onChanged: (phone) => context
                          .read<LoginBloc>()
                          .add(LoginPhoneChanged(phone)),
                      error: 'Girizilen telefon belgi nadogrydyr',
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  ShakeMe(
                    key: shakeKey,
                    shakeCount: 3,
                    shakeOffset: 10,
                    shakeDuration: const Duration(milliseconds: 500),
                    child: Checkbox(
                      value: checkBoxKey.value,
                      onChanged: (_) => checkBoxKey.value = !checkBoxKey.value,
                      activeColor: AppColors.secondary,
                    ),
                  ),
                  const AuthPrivacyPolicyView(),
                ],
              ),
              const Spacer(),

              AppButton(
                onTap: () {
                  if (formKey.currentState?.validate() ?? false) {
                    if (checkBoxKey.value) {
                      log('----------------Validating to OTP----------------');
                      context.read<LoginBloc>().add(LoginSendOtpRequested());
                    } else {
                      shakeKey.currentState?.shake();
                    }
                  }
                },
                buttonText: context.l10n.getCode,
                color: AppColors.secondary,
                textColor: AppColors.quaterniary,
              ).paddingSymmetric(horizontal: 5),
              //
            ],
          );
        },
      ),
    );
  }
}
