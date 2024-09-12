// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:app_ui/app_ui.dart';
import 'package:data_provider/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:meno_shop/app/app.dart';
import 'package:meno_shop/constants/constants.dart';
import 'package:meno_shop/l10n/l10n.dart';
import 'package:meno_shop/product_details/product_details.dart';
import 'package:meno_shop/products/products.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
  });
  final ProductItem product;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final locale = context.l10n.localeName;
    return AppWrapper(
      expand: 2.0,
      borderColor: AppColors.neutral.shade300,
      child: SizedBox(
        width: size.width * 0.48,
        child: AspectRatio(
          aspectRatio: 155 / 286,
          child: InkWell(
            onTap: () {
              context
                ..read<ProductDetailsBloc>()
                    .add(ProductDetailsRequested(productUuid: product.uuid!))
                ..pushNamed(
                  RouteNames.productDetails.name,
                  pathParameters: {'uuid': product.uuid!},
                );
            },
            borderRadius: BorderRadius.circular(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AspectRatio(
                  aspectRatio: 149 / 157,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      /// Product image

                      ProductImage(
                        imageUrl:
                            product.photo != null && product.photo!.isNotEmpty
                                ? product.photo!.first.path!.fullPath()
                                : null,
                      ),

                      /// Product favorite button and advantages icon
                      ProductFavoritesButton(uuid: product.uuid!)
                      // ProductAdvantageSticker(product: product),
                    ],
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      child: Text(
                        product.name!.changeLocale(locale),
                        softWrap: true,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const AppTextStyle.text()
                            .semiBold()
                            .sm()
                            .withColor(AppColors.primary),
                      ),
                    ),
                    ProductCartAddButton(productUuid: product.uuid!),
                  ],
                ).paddingAll(10),
                ProductDetailsPrices(
                  price: product.discounts?.discountedPrice ?? product.price!,
                  originalPrice: product.discounts?.originalPrice,
                ),
                ProductAdvantagesList(advantages: product.advantages),
              ],
            ),
          ),
        ),
      ),
    ).paddingOnly(right: 10);
  }
}

class ProductImage extends StatelessWidget {
  const ProductImage({
    super.key,
    required this.imageUrl,
  });

  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.maxFinite,
      width: double.maxFinite,
      child: AppWrapper(
        expand: 0.5,
        borderColor: AppColors.neutral.shade300,
        child: AppImage(imageUrl: imageUrl),
      ).clipper(10),
    );
  }
}
