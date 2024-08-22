import 'dart:developer';

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:meno_shop/features/auth/auth.dart';
import 'package:meno_shop/features/auth/ui/login_page/widgets/bottomsheet.dart';

class LoginContent extends HookWidget {
  const LoginContent({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = useMemoized(() => GlobalKey<FormState>());

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.57,
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          final readOnly = state.status.isInProgress;
          final bool isPrivate = context.select(
            (LoginBloc bloc) => bloc.state.isPrivacyPolicyChecked,
          );
          log('------------#########-------Bloc privacy check$isPrivate');
          return Column(
            children: [
              Form(
                key: formKey,
                child: ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(AppSpacing.md),
                  children: [
                    Text(
                      'Telefon belginizi girizin!',
                      style: const AppTextStyle.text().xxl().bold(),
                    ).centralize(),
                    Text(
                      'Biz sizin telefon belginize OTP kodyny \nugradarys!',
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
                  Checkbox(
                    value: isPrivate,
                    onChanged: (value) {
                      context.read<LoginBloc>().add(
                            LoginPrivacyChanged(!isPrivate),
                          );
                    },
                    activeColor: AppColors.secondary,
                  ),
                  SizedBox(
                    width: 310,
                    child: InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          shape: ShapeBorderX.verticalRectangle(10),
                          backgroundColor: Colors.white,
                          context: context,
                          isScrollControlled: true,
                          builder: (context) {
                            return const BottomShet();
                          },
                        );
                      },
                      child: const AuthPrivacyPolicyText(),
                    ),
                  ),
                ],
              ),
              const Expanded(child: SizedBox()),

              /// Next button
              NextButton(
                onPressed: () {
                  if (formKey.currentState?.validate() ?? false) {
                    if (isPrivate) {
                      context.read<LoginBloc>().add(LoginPhoneSubmitted());
                    } else {
                      // _shakeScreen();
                    }
                  }
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
