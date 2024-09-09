import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meno_shop/constants/constants.dart';
import 'package:meno_shop/l10n/l10n.dart';
import 'package:meno_shop/product/product.dart';
import 'package:meno_shop/product_details/product_details.dart';
import 'package:meno_shop/shimmer/shimmer.dart';

class ProductDetailsContent extends StatelessWidget {
  const ProductDetailsContent({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = context.l10n.localeName;

    return BlocBuilder<ProductsBloc, ProductsState>(
      builder: (context, state) {
        switch (state.status) {
          case ProductsStatus.singleProductLoading:
            return const ProductDetailsLoadingView();

          case ProductsStatus.singleProductPopulated:
            if (state.singleProduct != null) {
              final product = state.singleProduct!;
              final photos = product.photo;
              final discount = product.discounts;
              final description = product.description;
              final sizes = product.sizes;
              log('Populated product: $product');
              log('Populated photos: $photos');

              return Column(
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
                  if (discount != null)
                    ProductDetailsDiscount(
                      originalPrice: discount.originalPrice!,
                      discountedPrice: discount.discountedPrice!,
                      onSalePercent: discount.percentage!,
                    ),
                  ProductDetailsDescriptionText(
                    description: description!.changeLocale(locale),
                  ),
                  // if (sizes != null)
                   const ProductDetailsSizeSelector(),
                  if (product.subcategories != null)
                    ProductDetailsSimilarProducts(
                        products: product.subcategories!.products)
                ],

              );
            } else {
              // If state.singleProduct is null, return a fallback UI
              return const Center(child: Text('Product not found.'));
            }

          case ProductsStatus.singleProductFailure:
            return const Center(child: Text('Failed to load product details.'));

          default:
            return const SizedBox();
        }
      },
    );
  }
}
