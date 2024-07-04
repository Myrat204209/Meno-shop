// ignore_for_file: public_member_api_docs, sort_constructors_first

// import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:meno_shop/product_details/product_details.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: ProductDetailsAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductDetailsImageSlider(
              imageLinks: [
                'https://images.app.goo.gl/WNiYrQyTz84wPzh67',
                'https://images.app.goo.gl/jXBCXHhbKc2fYNUH6',
                'https://images.app.goo.gl/FkoxGqdwZwvkQiwU7'
              ],
            ),
            Gap(10),
            ProductDetailsLabelText(label: 'Friends Printed'),
            SizedBox(height: 10),
            ProductDetailRichText(),
            SizedBox(height: 10),
            ProductDetailsRow(onSalePercent: 50),
            SizedBox(height: 10),
            ProductDetailsDescriptionText(descriptionText: ''),
            SizedBox(height: 10),
            ProductDetailsLabelText(label: 'Choose color'),
            SizedBox(height: 10),
            ProductDetailsColorSelector(
              colors: [
                Colors.red,
                Colors.black,
                Colors.blue,
                Colors.green,
              ],
              checkedColorIndex: 0,
            ),
            SizedBox(height: 10),
            ProductDetailsLabelText(label: 'Select size'),
            SizedBox(height: 10),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
