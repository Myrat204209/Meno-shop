// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:data_provider/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:meno_shop/app/app.dart';

import 'package:meno_shop/cart/cart.dart';

class CartContent extends StatelessWidget {
  const CartContent({
    super.key,
    this.carts,
  });
  final List<CartItem?>? carts;
  @override
  Widget build(BuildContext context) {
    final totalCost = context.select((CartBloc bloc) => bloc.state.totalCost);
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: carts?.length,
                itemBuilder: (context, index) {
                  if (carts == null || carts == []) {
                    return const SizedBox();
                  } else {
                    final cart = carts?[index];
                    return AppCard(
                      leading: const AppImage(imageUrl: 'http://flutter'),
                      title: Text(cart!.productName),
                      subtitle: Text('${cart.price}'),
                      onPressed: () {},
                    );
                  }
                },
              ),
            ),

            ///Divider
            Divider(color: AppColors.neutral.shade300),

            ///Total price and cancel button
            CartBottomActionRow(
              onBottomRowTap: () => showCartSelectBottomSheet,
              onButtonPressed: () {
                context.pushNamed(RouteNames.addresses.name);
              },
              totalPrice: totalCost,
              buttonText: 'Confirm Cart',
            ),
          ],
        );
      },
    );
  }
}
