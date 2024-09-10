import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:meno_shop/search/app_search_bar.dart';

class CategoriesAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CategoriesAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const AppSearchBar(),
      backgroundColor: AppColors.quaterniary,
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 80);
}
