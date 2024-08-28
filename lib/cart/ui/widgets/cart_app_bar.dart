import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meno_shop/cart/cart.dart';
import 'package:meno_shop/l10n/l10n.dart';

class CartAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CartAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        context.l10n.cart,
      ),
      scrolledUnderElevation: 0,
      centerTitle: true,
      actions: [
        TextButton(
          onPressed: () {
            context.read<CartBloc>().add(CartClearRequested());
          },
          child: Text(
            'Remove all',
            style: const AppTextStyle.text().withColor(AppColors.secondary),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 80);
}
