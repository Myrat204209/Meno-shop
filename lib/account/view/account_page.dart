import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:meno_shop/account/view/view.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

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
      body: const AccountView(),
    );
  }
}
