import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:meno_shop/l10n/l10n.dart';
import 'package:meno_shop/profile/view/view.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.l10n.profile,
          style: const AppTextStyle.text()
              .lg()
              .semiBold()
              .withColor(AppColors.primary)
              .copyWith(fontWeight: FontWeight.w700),
        ).paddingOnly(top: 30),
        elevation: 0,
      ),
      body: const ProfileView(),
    );
  }
}
