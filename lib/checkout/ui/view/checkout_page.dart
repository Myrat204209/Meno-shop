import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meno_shop/cart/cart.dart';
import 'package:meno_shop/checkout/checkout.dart';
import 'package:meno_shop/orders/orders.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CheckoutBloc(
        cartRepository: context.read<CartRepository>(),
        orderRepository: context.read<OrderRepository>(),
      )..add(CheckoutRequested()),
      child: const CheckoutView(),
    );
  }
}

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CheckoutBloc, CheckoutState>(
      listenWhen: (previous, current) =>
          current.status == CheckoutStatus.completingSuccess,
      listener: (context, state) {
        ScaffoldMessenger.of(context)
          ..clearSnackBars()
          ..showSnackBar(
            const SnackBar(
              content: Text('Order created successfully!'),
            ),
          );
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Checkout')),
        body: const CheckoutContent(),
      ),
    );
  }
}
