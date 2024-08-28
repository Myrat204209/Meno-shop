// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:app_ui/app_ui.dart';
import 'package:data_provider/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:meno_shop/constants/constants.dart';

import '../ui.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({
    super.key,
    required this.uuid,
    required this.product,
    // required this.similarProducts,
  });
  final String uuid;
  final ProductItem product;

  // final List<ProductItem?>? similarProducts;
  @override
  Widget build(BuildContext context) {
    final discount = product.discounts;
    final photos = product.photo;
    final description = product.description;
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
                //TODO: Fetch visit counter
                const ProductDetailsVisitCounter(),

                ProductDetailsName(productName: product.name ?? ''),
                const ProductDetailsProductOffers(),

                ///Discount
                if (discount != null)
                  ProductDetailsDiscount(
                    originalPrice: discount.originalPrice!,
                    discountedPrice: discount.discountedPrice!,
                    onSalePercent: discount.percentage!,
                  ),

                ///Description
                ProductDetailsDescriptionText(
                  description: description ?? '',
                ),

                // const ProductDetailsColorSelector(
                //   colors: productDetailsColors,
                //   checkedColorIndex: 0,
                // ),
                const SizedBox(height: 20),
                // const ProductDetailsSizeSelector(),
                const SizedBox(height: 20),
                const ProductDetailsSimilarProducts(
                  products: [],
                ),
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
                ProductDetailsCartCounter(
                  addOneButton: () {},
                  removeOneButton: () {},
                  quantity: 1,
                ),
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
