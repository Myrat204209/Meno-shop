// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:app_ui/app_ui.dart';
import 'package:data_provider/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meno_shop/cart/cart.dart';
import 'package:meno_shop/constants/constants.dart';
import 'package:meno_shop/l10n/l10n.dart';

import '../ui.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({
    super.key,
    required this.uuid,
    required this.product,
  });
  final String uuid;
  final ProductItem product;

  // final List<ProductItem?>? similarProducts;
  @override
  Widget build(BuildContext context) {
    final discount = product.discounts;
    final photos = product.photo;
    final description = product.description;
    final locale = context.l10n.localeName;
    final cartBloc = context.read<CartBloc>();
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductDetailsImageSlider(
                  imageLinks: photos
                      ?.map(
                        (e) => (e.path ?? '').fullPath(),
                      )
                      .toList(),
                ),
                // const ProductDetailsVisitCounter(),

                ProductDetailsName(
                    productName: product.name!.changeLocale(locale)),
                // const ProductDetailsProductOffers(),

                ///Discount
                if (discount != null)
                  ProductDetailsDiscount(
                    originalPrice: discount.originalPrice!,
                    discountedPrice: discount.discountedPrice!,
                    onSalePercent: discount.percentage!,
                  ),

                ///Description
                ProductDetailsDescriptionText(
                  description: description!.changeLocale(locale),
                ),

                // const ProductDetailsColorSelector(
                //   colors: productDetailsColors,
                //   checkedColorIndex: 0,
                // ),
                // const SizedBox(height: AppSpacing.lg),
                // const ProductDetailsSizeSelector(),
                // const SizedBox(height: AppSpacing.lg),
                // const ProductDetailsSimilarProducts(
                //   products: [],
                // ),
                // const SizedBox(height: AppSpacing.lg),
              ],
            ),
          ),
        ),
        BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            final quantity = cartBloc.showQuantity(product.uuid!);
            return Column(
              children: [
                Divider(color: AppColors.neutral.shade300),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ProductDetailsCartCounter(
                      counterQuantity: quantity,
                      addOneButton: () {
                        cartBloc.add(CartItemAdded(CartItem(
                          uuid: product.uuid!,
                          productName: product.name!.changeLocale(locale),
                          quantity: quantity,
                          price: product.price!,
                        )));
                      },
                      removeOneButton: () {
                        cartBloc.add(CartItemRemoved(CartItem(
                          uuid: product.uuid!,
                          productName: product.name!.changeLocale(locale),
                          quantity: quantity,
                          price: product.price!,
                        )));
                      },
                    ),
                    AppButton.standard(
                      buttonText: 'Add to Cart',
                      onTap: cartBloc.isCartAdded(product.uuid!)
                          ? null
                          : () {
                              cartBloc.add(CartItemAdded(CartItem(
                                uuid: product.uuid!,
                                productName: product.name!.changeLocale(locale),
                                quantity: 1,
                                price: product.price!,
                              )));
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
          },
        )
      ],
    );
  }
}
