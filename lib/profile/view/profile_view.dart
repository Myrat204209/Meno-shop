// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:meno_shop/profile/profile.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: UIColors.quaterniary,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 40,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name',
              style: UITextStyle.subtitle1.copyWith(color: UIColors.primary),
            ),
            Text(
              'Myrat',
              style: UITextStyle.headline5.copyWith(color: UIColors.primary),
            ),
            const SizedBox(height: 50),
            ProfilePageButton(
              title: 'Account',
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const AccountPage(),
                ));
              },
            ),
            ProfilePageButton(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const MyAddressPage(),
                ));
              },
              title: 'My Address',
            ),
            ProfilePageButton(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const OrdersPage(),
                ));
              },
              title: 'Orders',
            ),
            ProfilePageButton(
              onTap: () {},
              title: 'Logout',
            ),
          ],
        ),
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          splashColor: UIColors.secondary.withOpacity(0.3),
          onTap: onTap,
          borderRadius: BorderRadius.circular(10),
          onLongPress: () {
            log('Long press $title ishledi');
          },
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: SizedBox(
              height: 45,
              width: double.maxFinite,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(8.0),
                  color: const Color.fromARGB(254, 248, 250, 252),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: UITextStyle.subtitle2
                            .copyWith(color: UIColors.primary),
                      ),
                      Icon(
                        Icons.chevron_right_rounded,
                        weight: 0.1,
                        color: UIColors.primary,
                        size: 45,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
