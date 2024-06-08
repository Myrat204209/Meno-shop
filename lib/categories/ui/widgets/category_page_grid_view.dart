import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:meno_shop/categories/categories.dart';

class CategoryPageGridView extends StatelessWidget {
  const CategoryPageGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 10,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisExtent: 120,
        crossAxisCount: 3,
        crossAxisSpacing: 5,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        return CategoryModelWidget(
          imageLink: 'assets/jeans.jpg',
          label: 'For women T-Shirt',
          elementColor: UIColors.primary,
          color: UIColors.neutral.shade100,
        );
      },
    );
  }
}
