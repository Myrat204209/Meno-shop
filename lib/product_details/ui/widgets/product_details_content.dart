// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:data_provider/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:meno_shop/constants/constants.dart';
import 'package:meno_shop/l10n/l10n.dart';

import 'widgets.dart';

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
    final discount = product.discounts;
    final description = product.description;
    return Column(
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

        ProductDetailsName(productName: product.name!.changeLocale(locale)),
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
        const ProductDetailsSizeSelector(),
        // const SizedBox(height: AppSpacing.lg),
        // const ProductDetailsSimilarProducts(
        //   products: [],
        // ),
        // const SizedBox(height: AppSpacing.lg),
      ],
    );
  }
}
