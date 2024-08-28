// ignore_for_file: public_member_api_docs, sort_constructors_first

// import 'package:app_ui/app_ui.dart';
import 'package:data_provider/data_provider.dart';
import 'package:flutter/material.dart';

import 'package:meno_shop/product_details/product_details.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({
    super.key,
    required this.uuid,
    required this.product,
  });
  final String uuid;
  final ProductItem product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ProductDetailsAppBar(),
      body: ProductDetailsView(
        uuid: uuid,
        product: product,
      ),
    );
  }
}
