import 'package:flutter/material.dart';
import 'package:meno_shop/checkout/checkout.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //TODO: L10n check out
        title: const Text('Checkout'),
      ),
      body: const CheckoutContent(),
    );
  }
}
