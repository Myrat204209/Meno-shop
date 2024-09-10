import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:meno_shop/search/search.dart';

import 'widgets.dart';


class ProductsAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const ProductsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const AppSearchBar(),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.filter_list,
            size: 30,
            color: AppColors.primary,
          ),
          onPressed: () => showFilterBottomSheet(context: context),
        ).paddingOnly(right: 16),
      ],
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 80);
}
