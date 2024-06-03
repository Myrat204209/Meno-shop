import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:meno_shop/product/ui/product_details/product_details.dart';

class HomePageProductsList extends StatelessWidget {
  const HomePageProductsList({
    super.key,
    required this.products,
  });

  final List<AppProductItem> products;

  @override
  Widget build(BuildContext context) {
    int index = 0;
    return SliverToBoxAdapter(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const AppTitledWithViewAllRow(title: 'Select Products'),
          ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 300, maxWidth: 300),
            child: ListView.builder(
              itemCount: 2,
              prototypeItem: AppProductItem(
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
              scrollDirection: Axis.horizontal,
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
          ),
        ],
      ),
    );
  }
}
