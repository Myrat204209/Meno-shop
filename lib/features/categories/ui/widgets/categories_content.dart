import 'package:app_ui/app_ui.dart';
import 'package:data_provider/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:meno_shop/features/categories/categories.dart';

class CategoriesContent extends StatelessWidget {
  const CategoriesContent({
    super.key,
    required this.categories,
  });
  final List<CategoryItem> categories;
  @override
  Widget build(BuildContext context) {
    if (categories.isEmpty) {
      SizedBox(
          height: 20,
          width: 20,
          child: const CircularProgressIndicator.adaptive().centralize());
    }
    return ListView.builder(
      itemCount: categories.length,
      itemBuilder: (context, index) {
        var category = categories[index];
        var subcategory = category.subcategories;
        if (subcategory!.isEmpty) {
          return const SizedBox();
        }
        if (subcategory != [] && subcategory.isNotEmpty) {
          return CategoriesExpansionTile(
            category: category,
          );
        }
        return null;
      },
    );
  }
}
