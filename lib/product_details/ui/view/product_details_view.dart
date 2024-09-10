// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:developer';

import 'package:app_ui/app_ui.dart';
import 'package:data_provider/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meno_shop/cart/cart.dart';
import 'package:meno_shop/l10n/l10n.dart';
import 'package:meno_shop/shimmer/shimmer.dart';

import '../ui.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({
    super.key,
    required this.uuid,
  });

  final String uuid;

  @override
  Widget build(BuildContext context) {
    final cartBloc = context.read<CartBloc>();
    log('-----------------------ProductDetailsView geldiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii...');
    CartItem cartItem = CartItem(uuid: '', quantity: 0, size: '', creator: '');
    return BlocListener<ProductDetailsBloc, ProductDetailsState>(
      listener: (context, state) {
        if (state.status == ProductDetailsStatus.populated) {
          final product = state.product;
          log('------------cart un product fetch boldy');
          if (product != null) {
            cartItem = cartItem.copyWith(
              uuid: product.uuid,
              creator: product.creator?.uuid ?? '',
              quantity: cartBloc.showQuantity(product.uuid!),
              size: '',
            );
          }
        } else if (state.status == ProductDetailsStatus.loading) {
          const ProductDetailsLoadingView();
        }
      },
      child: Column(
        children: [
          const Flexible(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: ProductDetailsContent(),
            ),
          ),
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              if (state.status == CartStatus.loading) {
                return const CircularProgressIndicator();
              } else if (state.status == CartStatus.loadingSuccess ||
                  state.status == CartStatus.updatingSuccess) {
                return Column(
                  children: [
                    Divider(color: AppColors.neutral.shade300),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ProductDetailsCartCounter(
                          counterQuantity: cartBloc.showQuantity(cartItem.uuid),
                          addOneButton: () {
                            log('-----------cartItem ${cartItem.quantity} -------');
                            final updatedItem = cartItem.copyWith(
                                quantity:
                                    cartBloc.showQuantity(cartItem.uuid) + 1);
                            cartBloc.add(CartItemAdded(cartItem: updatedItem));
                          },
                          removeOneButton: () {
                            final updatedItem = cartItem.copyWith(
                                quantity:
                                    cartBloc.showQuantity(cartItem.uuid) - 1);
                            cartBloc.add(CartItemAdded(cartItem: updatedItem));
                          },
                        ),
                        AppButton.standard(
                          buttonText: context.l10n.addToCart,
                          onTap: () {
                            final updatedItem = cartItem.copyWith(
                                uuid: cartItem.uuid,
                                quantity: 1,
                                size: cartItem.size,
                                creator: cartItem.creator);
                            cartBloc.add(CartItemAdded(cartItem: updatedItem));
                            // ScaffoldMessenger.of(context).showSnackBar(
                            //   SnackBar(
                            //     content: Text(context.l10n.addToCart),
                            //   ),
                            // );
                          },
                          icon: const Icon(
                            Icons.shopping_bag_outlined,
                            color: AppColors.quaterniary,
                          ),
                        )
                      ],
                    ).paddingSymmetric(vertical: 5),
                  ],
                );
              }
              return const SizedBox();
            },
          )
        ],
      ),
    );
  }
}
