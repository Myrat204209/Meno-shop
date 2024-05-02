import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class HomePageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomePageAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const AppSearchField(),
      actions: [
        AppActionsButton(
          icon: Icons.notifications_none_outlined,
          onPressed: () {},
        ),
      ],
    );
  }

  //TODO: Search for more information on this widget
  @override
  Size get preferredSize => const Size(200, 70);
}
