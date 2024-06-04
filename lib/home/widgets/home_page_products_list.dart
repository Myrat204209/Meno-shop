// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

import 'package:meno_shop/product/ui/product_details/product_details.dart';

class HomePageProductsList extends StatelessWidget {
  const HomePageProductsList({
    super.key,
    required this.products,
    required this.title,
  });

  final List<AppProductItem> products;
  final String? title;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppTitledWithViewAllRow(
            title: title ?? '',
            padding: 10,
            onViewAllTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const ProductDetailsPage(),
            )),
          ),
          AppHorizontalListView(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            itemCount: products.length,
            separatorBuilder: (context, index) => const SizedBox(width: 10),
            itemBuilder: (context, index) => AppProductItem(
              price: products[index].price,
              image: products[index].image,
              label: products[index].label,
              category: products[index].category,
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ProductDetailsPage(),
                ));
              },
            ),
          ),
        ],
      ),
    );
  }
}
