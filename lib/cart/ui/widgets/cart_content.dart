import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:meno_shop/cart/cart.dart';
import 'package:meno_shop/checkout/checkout.dart';
import 'package:meno_shop/orders/orders.dart';
import 'package:meno_shop/shimmer/shimmer.dart';

class CartContent extends HookWidget {
  const CartContent({super.key});

  @override
  Widget build(BuildContext context) {
    final totalCost = context.select((CartBloc bloc) => bloc.state.totalCost);
    return BlocProvider(
      create: (context) => CheckoutBloc(
        cartRepository: context.read<CartRepository>(),
        orderRepository: context.read<OrderRepository>(),
      ),
      child: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state.status == CartStatus.loading) {
            return const CartLoadingView();
          } else if (state.cart.isEmpty || state.cart == []) {
            return const Text('Sebetde haryt ýok').centralize();
          } else {
            final cartProducts = state.cart;

            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartProducts.length,
                    itemBuilder: (context, index) {
                      final cart = cartProducts[index];
                      return CartTile(cart: cart!);
                    },
                  ),
                ),
                Divider(color: AppColors.neutral.shade300),
                CartModalSheet(
                  totalCost: totalCost,
                  actionNeeded: true,
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
