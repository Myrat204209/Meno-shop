// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:data_provider/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:meno_shop/category_products/category_products.dart';

class CategoryProductsPage extends StatelessWidget {
  const CategoryProductsPage({
    super.key,
    required this.category,
    // required this.subcategory,
  });
  final CategoryItem category;
  // final SubcategoryItem subcategory;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CategoryProductsAppBar(),
      body: CategoryProductsView(
        category: category,
        // subcategory: subcategory,
      ),
    );
  }
}
