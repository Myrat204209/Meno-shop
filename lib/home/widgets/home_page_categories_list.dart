import 'dart:developer';

import 'package:app_ui/app_ui.dart';
import 'package:data_provider/data_provider.dart' show CategoryItem;
import 'package:flutter/material.dart';
import 'package:meno_shop/categories/categories.dart';
import 'package:meno_shop/main/main.dart';
import 'package:meno_shop/product/product.dart';

class HomePageCategoriesList extends StatelessWidget {
  const HomePageCategoriesList({
    super.key,
    required this.categories,
  });
  final List<CategoryItem> categories;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppTitledWithViewAllRow(
            title: 'Select Category',
            onViewAllTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => const ProductDetailsPage(),
            )),
          ),
          AppHorizontalListView(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            itemCount: categories.length,
            separatorBuilder: (context, index) => const SizedBox(width: 15),
            itemBuilder: (context, index) {
              final CategoryItem category = categories[index];
              String? name = category.name;
              String? path = category.photo?.first.path;
              log("Photo link $kDefaultBaseUrl\\$path\n");
              return CategoryModelWidget(
                label: name ?? 'meno',
                color: AppColors.neutral.shade100,
                elementColor: AppColors.primary,
                imageLink: '$kDefaultBaseUrl\\$path',
              );
            },
          ),
        ],
      ),
    );
  }
}
