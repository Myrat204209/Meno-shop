import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meno_shop/constants/constants.dart';
import 'package:meno_shop/l10n/l10n.dart';
import 'package:meno_shop/product_details/product_details.dart';
import 'package:meno_shop/shimmer/shimmer.dart';

class ProductDetailsContent extends StatelessWidget {
  const ProductDetailsContent({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = context.l10n.localeName;

    return BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
      builder: (context, state) {
        switch (state.status) {
          case ProductDetailsStatus.loading:
            return const ProductDetailsLoadingView();

          case ProductDetailsStatus.populated:
            if (state.product != null) {
              final product = state.product!;
              final photos = product.photo;
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
                  
                    ProductDetailsDiscount(
                      price: product.price!,
                      discount: product.discounts,
                    ),
                  ProductDetailsDescriptionText(
                    description: description!.changeLocale(locale),
                  ),
                  if (sizes != null)
                    ProductDetailsSizeSelector(uuid: product.uuid!),
                  if (product.subcategories != null)
                    ProductDetailsSimilarProducts(
                        products: product.subcategories!.products)
                ],
              );
            } else {
              // If state.singleProduct is null, return a fallback UI
              return const Center(child: Text('Product not found.'));
            }

          case ProductDetailsStatus.failure:
            return const Center(child: Text('Failed to load product details.'));

          default:
            return const SizedBox();
        }
      },
    );
  }
}
