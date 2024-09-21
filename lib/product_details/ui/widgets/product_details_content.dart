// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:app_ui/app_ui.dart';
import 'package:data_provider/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meno_shop/cart/ui/bloc/cart_bloc.dart';
import 'package:meno_shop/constants/constants.dart';
import 'package:meno_shop/l10n/l10n.dart';
import 'package:meno_shop/product_details/product_details.dart';

class ProductDetailsContent extends StatelessWidget {
  const ProductDetailsContent({
    super.key,
    required this.product,
  });

  final ProductItem product;

  @override
  Widget build(BuildContext context) {
    final locale = context.l10n.localeName;
    final photos = product.photo;
    final description = product.description;
    final sizes = product.sizes;

    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductDetailsImageSlider(
                  imageLinks: photos
                      ?.map((photo) => (photo.path ?? '').fullPath())
                      .toList(),
                ),
                ProductDetailsName(
                  productName: product.name!.changeLocale(locale),
                ),
                ProductDetailsDiscount(
                  price: product.price!,
                  discount: product.discounts,
                ),
                ProductDetailsDescriptionText(
                  description: description!.changeLocale(locale),
                ),
                if (sizes != null)
                  ProductDetailsSizeSelector(
                    sizes: sizes,
                  ),
                if (product.subcategories != null)
                  ProductDetailsSimilarProducts(
                      subcategoryId: product.subcategoryId!,
                      products: product.subcategories!.products),
              ],
            ),
          ),
        ),
        Column(
          children: [
            Divider(color: AppColors.neutral.shade300),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BlocBuilder<CartBloc, CartState>(
                  buildWhen: (previous, current) =>
                      previous.totalCost != current.totalCost,
                  builder: (context, state) {
                    return ProductDetailsCartCounter(
                      counterQuantity: state.currentItem!.quantity,
                      addOneButton: () => context
                          .read<CartBloc>()
                          .add(const CartItemOneUpdated(isForAdding: true)),
                      removeOneButton: () => context
                          .read<CartBloc>()
                          .add(const CartItemOneUpdated(isForAdding: false)),
                    );
                  },
                ),
                AppButton.standard(
                  buttonText: context.l10n.addToCart,
                  onTap: () {
                    context.read<CartBloc>().add(CartItemAdded());
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
}
