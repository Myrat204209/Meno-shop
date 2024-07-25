import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:meno_shop/categories/categories.dart';
import 'package:meno_shop/l10n/l10n.dart';

class CategoryProductsPage extends StatelessWidget {
  const CategoryProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: AppSearchBar(hintText: context.l10n.searching),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.filter_list,
              size: 30,
              color: AppColors.primary,
            ),
            onPressed: () => showCategoriesFilterBottomSheet(context: context),
          ).paddingOnly(right: 16),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //TODO: Replace with actual functionality for product items
          const Text('For women / T-Shirt'),
          Text(
            'A Watch',
            style: const AppTextStyle.text()
                .lg()
                .bold()
                .withColor(AppColors.primary),
          ),
          const SizedBox(height: AppSpacing.xlg),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              scrollDirection: Axis.vertical,
              childAspectRatio: 160 / 285,
              mainAxisSpacing: 15,
              crossAxisSpacing: 5,
              padding: EdgeInsets.zero,
              children: [
                //TODO: Replace with actual product items
                AppProductItem(
                  image: Assets.images.jeans.path,
                  price: 550,
                  label: 'T-Shirt',
                  onTap: () {},
                ),
                AppProductItem(
                  image: Assets.images.jeans.path,
                  price: 550,
                  label: 'T-Shirt',
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ).paddingOnly(left: 10),
    );
  }
}
