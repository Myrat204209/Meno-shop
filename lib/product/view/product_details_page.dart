// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'view.dart';

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
      backgroundColor: UIColors.quaterniary,
      appBar: AppBar(
        title: Text(
          'Product Details',
          style: UITextStyle.headline4.copyWith(color: UIColors.primary),
        ),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.favorite_border_outlined,
              size: 30,
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: 16.w,
          right: 16.w,
        ),
        child: const SingleChildScrollView(
          child: SizedBox(
            height: 2000,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductDetailsImageSlider(
                  imageLinks: ['asa', 'asdasd', 'asdasdasdas'],
                ),
                Gap(15),
                ProductDetailsLabelText(label: 'Friends Printed'),
                Gap(20),
                ProductDetailRichText(),
                Gap(15),
                ProductDetailsRow(onSalePercent: 50),
                Gap(15),
                ProductDetailsRatingStarRow(initialRating: 1),
                Gap(20),
                ProductDetailsDescriptionText(
                  descriptionText: '',
                ),
                Gap(25),
                ProductDetailsLabelText(label: 'Choose color'),
                Gap(10),
                ProductDetailsColorSelector(
                  colors: [
                    Colors.red,
                    Colors.black,
                    Colors.blue,
                    Colors.green,
                  ],
                  checkedColorIndex: 0,
                ),
                Gap(10),
                ProductDetailsLabelText(label: 'Select size'),
                Gap(10),
                ProductDetailsSizeSelector(
                  sizes: ['32', '36', '38', '40', '42'],
                  selectedSize: '38',
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