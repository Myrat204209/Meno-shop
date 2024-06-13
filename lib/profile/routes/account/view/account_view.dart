import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.quaterniary,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.quaterniary,
        title: const Text(
          'Account',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: SingleChildScrollView(
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
              const UITextField(
                initialValue: "+993 ",
                labelText: 'Phone Number',
                keyboardType: TextInputType.phone,
              ),
              const UITextField.emailTextField(
                labelText: 'Email address',
                hintText: 'Your email address',
              ),
              UITextField.passwordTextField(
                labelText: 'Password',
                suffix: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.remove_red_eye,
                    size: 30,
                    color: AppColors.neutral.shade500,
                  ),
                ),
              ),
              const SizedBox(height: 60),
              AppButton(
                type: AppButtonType.large,
                text: 'Save',
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
