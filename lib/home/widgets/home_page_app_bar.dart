import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:meno_shop/l10n/l10n.dart';
import 'package:meno_shop/language/language.dart';
import 'package:meno_shop/notification/notification.dart';

class HomePageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomePageAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: AppSearchBar(
        hintText: context.l10n.searching,
      ),
      collapsedHeight: 60,
      scrolledUnderElevation: 0,
      pinned: true,
      backgroundColor: AppColors.quaterniary,
      actions: [
        AppActionsButton(
          icon: Icons.language,
          onPressed: () => showLanguageSelectBottomSheet(context: context),
          backgroundColor: AppColors.neutral.shade200,
        ),
        AppActionsButton(
          icon: Icons.notifications_none,
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const NotificationsPage(),
            ));
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 60);
}
