import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:meno_shop/categories/categories.dart';

class HomePageCategoriesList extends StatelessWidget {
  const HomePageCategoriesList({
    super.key,
    required this.images,
  });
  final List<String> images;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const AppTitledWithViewAllRow(title: 'Select Category'),
          ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 120),
            child: AppCategoryListView(
              images: images,
              scrollDirection: Axis.horizontal,
            ),
          ),
        ],
      ),
    );
  }
}
