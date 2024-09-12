// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meno_shop/cart/cart.dart';
import 'package:meno_shop/l10n/l10n.dart';
import 'package:meno_shop/product_details/product_details.dart';
import 'package:meno_shop/shimmer/shimmer.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({
    super.key,
    required this.uuid,
  });

  final String uuid;

  @override
  Widget build(BuildContext context) {
    final cartBloc = context.read<CartBloc>();
    return BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
      builder: (context, state) {
        if (state.status == ProductDetailsStatus.loading) {
          const ProductDetailsLoadingView();
        }
        if (state.status == ProductDetailsStatus.populated) {
          final product = state.product!;
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ProductDetailsContent(product: product),
                ),
              ),
              Column(
                children: [
                  Divider(color: AppColors.neutral.shade300),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ProductDetailsCartCounter(
                        counterQuantity: cartBloc.showQuantity(product.uuid!),
                        addOneButton: () {
                          cartBloc.add(CartItemQuantityUpdated(
                            productId: product.uuid!,
                            quantity: cartBloc.showQuantity(product.uuid!) + 1,
                          ));
                        },
                        removeOneButton: () {
                          cartBloc.add(CartItemQuantityUpdated(
                            productId: product.uuid!,
                            quantity: cartBloc.showQuantity(product.uuid!) - 1,
                          ));
                        },
                      ),
                      AppButton.standard(
                        buttonText: context.l10n.addToCart,
                        onTap: () {
                          cartBloc
                              .add(CartItemAdded(productUuid: product.uuid!));
                        },
                        icon: const Icon(
                          Icons.shopping_bag_outlined,
                          color: AppColors.quaterniary,
                        ),
                      )
                    ],
                  ).paddingOnly(bottom: 20),
                ],
              )
            ],
          );
        }
        return const SizedBox();
        // return const Center(child: Text('Haryt tapylmady.'));
      },
    );
  }
}
