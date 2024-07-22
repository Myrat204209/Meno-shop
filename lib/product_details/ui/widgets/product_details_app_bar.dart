import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class ProductDetailsAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const ProductDetailsAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'Product Details',
        style: const AppTextStyle.text().semiBold().xl(),
      ),
      scrolledUnderElevation: 0,
      centerTitle: true,
      actions: [
        AppActionsButton(
          onPressed: () {},
          icon: Icons.favorite_border_outlined,
          backgroundColor: AppColors.quaterniary,
          iconColor: AppColors.neutral.shade500,
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 80);
}
