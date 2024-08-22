import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meno_shop/features/l10n/l10n.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Column(
        children: [
          const SizedBox(height: 50),
          UITextField(
            hintText: 'Enter your name here',
            labelText: context.l10n.name,
            keyboardType: TextInputType.name,
            onChanged: (value) {},
            onSubmitted: (value) {},
          ),
          const SizedBox(height: 10),
          UITextField(
            labelText: context.l10n.phoneNumber,
            // controller: controller,
            keyboardType: TextInputType.phone,
            // maxLength: 8,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(8)
            ],
            autocorrect: false,
            prefixText: '+993 ',
            hintText: '61234567',

            // onChanged: onChanged,
            // suffix: suffix,
            // errorText: errorText,
            // onSubmitted: onSubmitted,
          ),
          const SizedBox(height: 10),
          // const UITextField.emailTextField(
          //   labelText: 'Email address',
          //   hintText: 'Your email address',
          // ),
          const SizedBox(height: 10),
          AppButton.expanded(
            buttonText: 'Save',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
/**
 * 
 */