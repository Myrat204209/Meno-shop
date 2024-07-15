import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.quaterniary,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.quaterniary,
        title: Text(
          'Account',
          style: const AppTextStyle.text().semiBold(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Column(
          children: [
            const SizedBox(height: 50),
            UITextField(
              hintText: 'Enter your name here',
              labelText: 'Name',
              keyboardType: TextInputType.name,
              onChanged: (value) {},
              onSubmitted: (value) {},
            ),
            const SizedBox(height: 10),
            UITextField(
              labelText: 'Phone Number',
              // controller: controller,
              keyboardType: TextInputType.phone,
              // maxLength: 8,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              autocorrect: false,
              prefixText: '+993 ',
              // onChanged: onChanged,
              // suffix: suffix,
              // errorText: errorText,
              // onSubmitted: onSubmitted,
            ),
            const SizedBox(height: 10),
            const UITextField.emailTextField(
              labelText: 'Email address',
              hintText: 'Your email address',
            ),
            const UITextField(
              labelText: 'Email address',
              hintText: 'Your email address',
            ),
            const SizedBox(height: 10),
            AppButton(
              type: AppButtonType.large,
              text: 'Save',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
