import 'package:flutter/material.dart';
import 'package:meno_shop/features/l10n/l10n.dart';
import 'package:meno_shop/features/orders/orders.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.l10n.orders,
        ),
        centerTitle: true,
      ),
      body: const OrdersView(),
    );
  }
}
