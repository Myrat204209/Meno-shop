import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

import 'view.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Cart',
        ),
        centerTitle: true,
      ),
      backgroundColor: AppColors.quaterniary,
      body: const CartView(),
    );
  }
}
