import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

import 'view.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Cart',
          style: UITextStyle.headline5.copyWith(
            color: UIColors.primary,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: UIColors.quaterniary,
      body: const CartView(),
    );
  }
}
