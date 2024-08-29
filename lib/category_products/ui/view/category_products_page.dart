// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:meno_shop/category_products/category_products.dart';

class CategoryProductsPage extends StatelessWidget {
  const CategoryProductsPage({
    super.key,
    // required this.subcategory,
  });
  // final SubcategoryItem subcategory;
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CategoryProductsAppBar(),
      body: CategoryProductsView(
          // subcategory: subcategory,
          ),
    );
  }
}
