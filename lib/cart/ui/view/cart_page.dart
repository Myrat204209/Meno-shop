import 'package:flutter/material.dart';
import 'package:meno_shop/cart/cart.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CartAppBar(),
      body: CartView(),
    );
  }
}
