// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

import '../ui.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({
    super.key,
    required this.uuid,
  });
  final String uuid;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              left: 16,
              right: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ProductDetailsImageSlider(
                //   imageLinks: ,
                // ),
                ProductDetailsVisitCounter(),
                // ProductDetailsName(product: product),
                ProductDetailsProductOffers(),
                ProductDetailsDiscount(),
                ProductDetailsDescriptionText(),
                ProductDetailsColorSelector(
                  colors: productDetailsColors,
                  checkedColorIndex: 0,
                ),
                SizedBox(height: 20),
                ProductDetailsSizeSelector(),
                SizedBox(height: 20),
                ProductDetailsSimilarProducts(
                  products: [],
                ),
                SizedBox(height: 20),
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
    );
  }
}
