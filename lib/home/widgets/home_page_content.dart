import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

import 'widgets.dart';

class HomePageContent extends StatelessWidget {
  const HomePageContent({
    super.key,
    required this.products,
  });
  final List<AppProductItem> products;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: CustomScrollView(
        shrinkWrap: true,
        slivers: [
          const HomePageBannerCard(),
          HomePageCategoriesList(images: images),
          HomePageProductsGrid(products: products),

          // HomePageProductsGrid(products: products),
        ],
      ),
    );
  }
}
