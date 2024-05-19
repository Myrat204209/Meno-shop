// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:meno_shop/product/product_details/product_details.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int selectedIndex = 5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ProductDetailsAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ProductDetailsImageSlider(
              imageLinks: ['asa', 'asdasd', 'asdasdasdas'],
            ),
            const SizedBox(height: 10),
            const ProductDetailsLabelText(label: 'Friends Printed'),

            const SizedBox(height: 10),
            const ProductDetailRichText(),
            const SizedBox(height: 10),
            const ProductDetailsRow(onSalePercent: 50),
            const SizedBox(height: 10),
            const ProductDetailsRatingStarRow(initialRating: 1),
            const SizedBox(height: 10),
            const ProductDetailsDescriptionText(descriptionText: ''),
            const SizedBox(height: 10),
            const ProductDetailsLabelText(label: 'Choose color'),
            const SizedBox(height: 10),
            const ProductDetailsColorSelector(
              colors: [
                Colors.red,
                Colors.black,
                Colors.blue,
                Colors.green,
              ],
              checkedColorIndex: 0,
            ),
            const SizedBox(height: 10),
            const ProductDetailsLabelText(label: 'Select size'),
            const SizedBox(height: 10),
            const ProductDetailsSizeSelector(
              sizes: ['32', '36', '38', '40', '42'],
              selectedSize: '38',
            ),
            const SizedBox(height: 10),
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (context, index) {
                return const AppProductItem(
                  price: 1,
                  label: 'as',
                  category: 'as',
                  image: 'assets/coat.png',
                );
              },
            ),

            //TODO: Comments section implemetation

            // LayoutBuilder(
            //   builder: (context, constraints) => GridView.builder(
            //     itemCount: 2,
            //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //       mainAxisExtent: constraints.maxHeight,
            //       crossAxisCount: 2,
            //     ),
            //     itemBuilder: (context, index) {
            //       return const AppProduct(
            //         price: 30,
            //         label: 'asdas',
            //         category: 'asas',
            //       );
            //     },
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}


/**
 * Positioned(
          bottom: 20,
          left: 0,
          child: Container(
            height: 50,
            width: 150,
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.neutral.shade300,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(
                  Icons.remove,
                  size: 30,
                  color: AppColors.primary,
                ),
                Text(
                  '1',
                  style: UITextStyle.headline5.copyWith(
                    color: AppColors.primary,
                  ),
                ),
                Icon(
                  Icons.add,
                  size: 30,
                  color: AppColors.primary,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 20,
          right: 0,
          child: AppButton(
            type: AppButtonType.iconed,
            text: 'Add to Cart',
            onTap: () {},
          ),
        ),
 */