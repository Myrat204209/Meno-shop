import 'package:flutter/material.dart';

import 'widgets.dart';

class ProductsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProductsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      forceMaterialTransparency: true,
      centerTitle: false,
      titleSpacing: 0,
      leadingWidth: 45,
      title: const ProductSearchField(),
      // actions: [
      //   IconButton(
      //     icon: const Icon(
      //       Icons.filter_list,
      //       size: 30,
      //       color: AppColors.primary,
      //     ),
      //     onPressed: () => AppBottomSheet.show(
      //       bottomModalChildren: const FilterBottomSheetContent(),
      //       context: context,
      //     ),
      //   ).paddingOnly(right: 16),
      // ],
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 80);
}
