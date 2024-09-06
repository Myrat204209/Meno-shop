// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meno_shop/constants/constants.dart';
import 'package:meno_shop/l10n/l10n.dart';
import 'package:meno_shop/product/product.dart';
import 'package:meno_shop/shimmer/shimmer.dart';

import 'widgets.dart';

class ProductDetailsContent extends StatelessWidget {
  const ProductDetailsContent({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = context.l10n.localeName;

    return BlocBuilder<ProductsBloc, ProductsState>(
      builder: (context, state) {
        final product =
            context.select((ProductsBloc bloc) => bloc.state.singleProduct);
        if (state.status == ProductsStatus.singleProductLoading) {
          return const ProductDetailsLoadingView();
        }
        final photos = product!.photo;
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
      },
    );
  }
}
