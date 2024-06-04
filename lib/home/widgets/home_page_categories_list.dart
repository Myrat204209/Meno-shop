import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:meno_shop/categories/categories.dart';
import 'package:meno_shop/product/product.dart';

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
          AppTitledWithViewAllRow(
            title: 'Select Category',
            onViewAllTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => const ProductDetailsPage(),
            )),
          ),
          AppHorizontalListView(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            itemCount: images.length,
            separatorBuilder: (context, index) => const SizedBox(width: 15),
            itemBuilder: (context, index) => CategoryModelWidget(
              label: index.toString(),
              color: UIColors.neutral.shade100,
              elementColor: UIColors.primary,
              imagePath: 'assets/${images[index]}',
            ),
          ),
        ],
      ),
    );
  }
}
