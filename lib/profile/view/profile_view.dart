// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:meno_shop/account/account.dart';
import 'package:meno_shop/addresses/address.dart';
import 'package:meno_shop/l10n/l10n.dart';
import 'package:meno_shop/orders/orders.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 40,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.name,
            style: const AppTextStyle.text().medium().sm(),
          ),
          Text(
            'Myrat',
            style: const AppTextStyle.text().semiBold().xl(),
          ),
          const SizedBox(height: 50),
          ProfilePageButton(
            title: 'Account',
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => const AccountPage(),
              ));
            },
          ),
          ProfilePageButton(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => const AddressPage(),
              ));
            },
            title: l10n.addresses,
          ),
          ProfilePageButton(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const OrdersPage(),
              ));
            },
            title: l10n.orders,
          ),
          ProfilePageButton(
            onTap: () {},
            title: 'Logout',
          ),
        ],
      ),
    );
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
        splashColor: AppColors.secondary.withOpacity(0.3),
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        onLongPress: () {
          log('Long press $title ishledi');
        },
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
