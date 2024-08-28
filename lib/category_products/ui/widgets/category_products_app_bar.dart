import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:meno_shop/l10n/l10n.dart';

import 'widgets.dart';

class CategoryProductsAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CategoryProductsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      title: AppSearchBar(hintText: context.l10n.searching),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.filter_list,
            size: 30,
            color: AppColors.primary,
          ),
          onPressed: () => showCategoriesFilterBottomSheet(context: context),
        ).paddingOnly(right: 16),
      ],
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 80);
}
