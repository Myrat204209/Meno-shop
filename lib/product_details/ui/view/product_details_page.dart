// ignore_for_file: public_member_api_docs, sort_constructors_first

// import 'package:app_ui/app_ui.dart';
import 'package:data_provider/data_provider.dart';
import 'package:flutter/material.dart';

import 'package:meno_shop/product_details/product_details.dart';

class ProductDetailsPage extends StatelessWidget {
  final ProductItem product;
  const ProductDetailsPage({
    super.key,
    required this.product,
    required this.uuid,
  });
  final String? uuid;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ProductDetailsAppBar(),
      body: ProductDetailsView(product: product),
    );
  }
}
