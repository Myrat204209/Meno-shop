// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:data_provider/data_provider.dart';
import 'package:flutter/material.dart';
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

    log('Product: $product');
    log('Photos: $photos');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProductDetailsImageSlider(
          imageLinks:
              photos?.map((photo) => (photo.path ?? '').fullPath()).toList(),
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
            uuid: product.uuid!,
            sizes: sizes,
          ),
        if (product.subcategories != null)
          ProductDetailsSimilarProducts(
              subcategoryId: product.subcategoryId!,
              products: product.subcategories!.products),
        // const Expanded(child: SizedBox()),
      ],
    );
  }
}
