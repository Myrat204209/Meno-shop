import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:meno_shop/features/l10n/l10n.dart';

class CategoriesAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CategoriesAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: AppSearchBar(
        hintText: context.l10n.searching,
      ),
      scrolledUnderElevation: 0,
      backgroundColor: AppColors.quaterniary,
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 80);
}
