import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meno_shop/cart/cart.dart';
import 'package:meno_shop/checkout/checkout.dart';
import 'package:meno_shop/orders/orders.dart';

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

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CheckoutBloc(
        cartRepository: context.read<CartRepository>(),
        orderRepository: context.read<OrderRepository>(),
      ),
      child: const CartContent(),
    );
  }
}
