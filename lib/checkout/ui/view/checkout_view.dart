import 'package:flutter/material.dart';
import 'package:meno_shop/checkout/checkout.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
        centerTitle: true,
      ),
      body: const CheckoutContent(),
    );
  }
}
