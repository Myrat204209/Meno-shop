// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:meno_shop/app/app.dart';
import 'package:meno_shop/cart/cart.dart';
import 'package:meno_shop/checkout/checkout.dart';
import 'package:meno_shop/l10n/l10n.dart';
import 'package:meno_shop/orders/orders.dart';
import 'package:meno_shop/shimmer/shimmer.dart';

class CartContent extends StatelessWidget {
  const CartContent({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final totalCost = context.select((CartBloc bloc) => bloc.state.totalCost);

    return BlocProvider(
      create: (context) => CheckoutBloc(
          cartRepository: context.read<CartRepository>(),
          orderRepository: context.read<OrderRepository>()),
      child: BlocBuilder<CartBloc, CartState>(
        // listener: (context, state) => state.cart,
        builder: (context, state) {
          // log('\x1B[33m------------------Sebetdaki  cart    ${state.cart} ---------------------');
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

                ///Divider
                Divider(color: AppColors.neutral.shade300),

                ///Total price and cancel button
                AppButton(
                  buttonText: context.l10n.cartConfirmation,
                  onTap: () => showCartSelectBottomSheet(context: context),
                ),

                //   onBottomRowTap: () => showCartSelectBottomSheet,
                //   onButtonPressed: (cartProducts.isEmpty)
                //       ? () => showCartConfirmBottomSheet
                //       : () => context.pushNamed(
                //             RouteNames.checkout.name,
                //           ),
                // ),
              ],
            ).paddingOnly(right: 5);
          }
        },
      ),
    );
  }
}
