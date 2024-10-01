import 'dart:developer';

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:meno_shop/cart/cart.dart';
import 'package:meno_shop/checkout/checkout.dart';
import 'package:meno_shop/l10n/l10n.dart';
import 'package:meno_shop/orders/orders.dart';
import 'package:meno_shop/shimmer/shimmer.dart';

class CartContent extends HookWidget {
  const CartContent({super.key});

  @override
  Widget build(BuildContext context) {
    // Hook to control animation
    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 300),
    );

    // State to keep track of whether the icon is expanded or collapsed
    final isExpanded = useState(false);
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
                InkWell(
                  splashColor: AppColors.transparent,
                  onTap: () {
                    log('--------------pressed-- value ${isExpanded.value}----');
                    animationController.forward();
                    AppBottomSheet.show(
                      useRootNavigator: false,
                      bottomModalChildren:
                          CartConfirmBottomSheetContent(totalCost: totalCost)
                              .colorize(Colors.green),
                      context: context,
                    ).then((value) {
                      animationController.reverse();
                      isExpanded.value = !isExpanded.value;
                    });
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      RotationTransition(
                        turns: Tween(begin: 0.0, end: 0.5)
                            .animate(animationController),
                        child: const Icon(
                          Icons.keyboard_arrow_down,
                          color: AppColors.secondary,
                          size: 35,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              context.l10n.totalPrice,
                              style: kCartDescriptionStyle,
                            ),
                            Text(
                              '${totalCost - 20} TMT',
                              style: kCartTotalTextStyle,
                            ),
                          ],
                        ),
                      ),
                      AppButton(
                        buttonText: context.l10n.cartConfirmation,
                        onTap: () => AppBottomSheet.show(
                          bottomModalChildren: const SizedBox.shrink(),
                          context: context,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ).paddingSymmetric(horizontal: 10);
          }
        },
      ),
    );
  }
}
