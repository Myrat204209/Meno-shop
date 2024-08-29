// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meno_shop/app/app.dart';
import 'package:meno_shop/l10n/l10n.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(l10n.name),
        Text(
          'Myrat',
          style: const AppTextStyle.text().semiBold().xl(),
        ),
        const SizedBox(height: 50),
        ProfilePageButton(
          title: 'Account',
          onTap: () => context.pushNamed(RouteNames.account.name),
        ),
        ProfilePageButton(
          title: l10n.myAddresses,
          onTap: () => context.pushNamed(RouteNames.addresses.name),
        ),
        ProfilePageButton(
          onTap: () => context.pushNamed(RouteNames.orders.name),
          title: l10n.orders,
        ),
        ProfilePageButton(
          onTap: () {
            context.pushNamed(RouteNames.auth.name);
          },
          title: 'Logout',
        ),
      ],
    ).paddingSymmetric(horizontal: 16, vertical: 40);
  }
}

class ProfilePageButton extends StatelessWidget {
  const ProfilePageButton({
    super.key,
    required this.onTap,
    required this.title,
  });
  final VoidCallback onTap;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.quaterniary,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: ListTile(
          leading: Text(
            title,
            style: const AppTextStyle.text().medium().sm(),
          ),
          shape: ShapeBorderX.roundedRectangle(10),
          tileColor: AppColors.neutral.shade200,
          contentPadding: const EdgeInsets.only(left: 15),
          trailing: const Icon(
            Icons.chevron_right,
            color: AppColors.primary,
            fill: 0.2,
            size: 40,
          ),
        ),
      ),
    ).paddingSymmetric(vertical: 7);
  }
}
