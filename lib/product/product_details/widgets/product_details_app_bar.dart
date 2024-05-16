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
        style: UITextStyle.headline5.copyWith(color: UIColors.primary),
      ),
      centerTitle: true,
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 10),
          child: Icon(
            Icons.favorite_border_outlined,
            size: 30,
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 80);
}
