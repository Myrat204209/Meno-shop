// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

import 'package:meno_shop/products/products.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({
    super.key,
    required this.subcategoryId,
  });

  // final String category;
  // final String subcategory;
  final String? subcategoryId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ProductsAppBar(),
      body: ProductsContent(
        subcategoryId: subcategoryId,
        // category: category,
        // subcategory: subcategory,
      ),
    );
  }
}
