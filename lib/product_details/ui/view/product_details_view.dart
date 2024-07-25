// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:data_provider/data_provider.dart';
import 'package:flutter/material.dart';

import '../ui.dart';

class ProductDetailsView extends StatelessWidget {
  final ProductItem product;
  const ProductDetailsView({
    super.key,
    required this.product,
    this.uuid,
  });
  final String? uuid;
  @override
  Widget build(BuildContext context) {
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
                const ProductDetailsImageSlider(
                  imageLinks: [
                    'https',
                    'https',
                  ],
                ),
                const ProductDetailsVisitCounter(),
                ProductDetailsName(product: product),
                const ProductDetailsProductOffers(),
                const ProductDetailsDiscount(),
                const ProductDetailsDescriptionText(),
                const ProductDetailsColorSelector(
                  colors: productDetailsColors,
                  checkedColorIndex: 0,
                ),
                const SizedBox(height: 20),
                const ProductDetailsSizeSelector(),
                const SizedBox(height: 20),
                const ProductDetailsSimilarProducts(),
                const SizedBox(height: 20),
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
                const ProductDetailsCartCounter(),
                AppButton.standard(
                  buttonText: 'Add to Cart',
                  onTap: () {
                    //TODO: Add product to cart
                  },
                  icon: const Icon(
                    Icons.shopping_bag_outlined,
                    color: AppColors.quaterniary,
                  ),
                )
              ],
            ).paddingSymmetric(vertical: 5),
          ],
        )
      ],
    ).colorize(AppColors.quaterniary);
  }
}
