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
      title: const Text(
        'Product Details',
      ),
      scrolledUnderElevation: 0,
      centerTitle: true,
      actions: [
        AppActionsButton(
          onPressed: () {},
          icon: Icons.favorite_border_outlined,
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 80);
}
