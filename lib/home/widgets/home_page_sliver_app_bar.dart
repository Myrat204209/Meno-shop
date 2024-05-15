import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class HomePageSliverAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const HomePageSliverAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      title: const AppSearchBar(),
      actions: [
        AppActionsButton(
          icon: Icons.notifications_none_outlined,
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 80);
}
