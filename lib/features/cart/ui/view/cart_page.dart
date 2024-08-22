import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:meno_shop/features/l10n/l10n.dart';

import 'view.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.l10n.cart,
        ),
        scrolledUnderElevation: 0,
        centerTitle: true,
      ),
      backgroundColor: AppColors.quaterniary,
      body: const CartView(),
    );
  }
}
