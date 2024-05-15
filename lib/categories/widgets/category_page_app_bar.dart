import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class CategoryPageAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CategoryPageAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
