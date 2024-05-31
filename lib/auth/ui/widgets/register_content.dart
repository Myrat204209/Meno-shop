import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:meno_shop/auth/auth.dart';

class RegisterContent extends StatelessWidget {
  const RegisterContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(AppSpacing.md),
      children: [
        /// Phone Input
        BlocBuilder<RegisterBloc, RegisterState>(
          builder: (context, state) {
            final readOnly = state.status.isInProgress;

            return PhoneInput(
              readOnly: readOnly,
              onChanged: (phone) =>
                  context.read<RegisterBloc>().add(RegisterPhoneChanged(phone)),
            );
          },
        ),

        const SizedBox(height: AppSpacing.md),
      ],
    );
  }
}
