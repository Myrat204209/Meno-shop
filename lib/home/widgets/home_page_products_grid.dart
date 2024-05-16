import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:meno_shop/product/product_details/product_details.dart';

class HomePageProductsGrid extends StatelessWidget {
  const HomePageProductsGrid({
    super.key,
    required this.products,
  });

  final List<AppProductItem> products;

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: products.length,
      itemBuilder: (context, index) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const AppTitledWithViewAllRow(title: 'Select Products'),
            GridView.builder(
              shrinkWrap: true,
              itemCount: products.length,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 310,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                return AppProductItem(
                  price: products[index].price,
                  image: products[index].image,
                  label: products[index].label,
                  category: products[index].category,
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ProductDetailsPage(),
                    ));
                  },
                );
              },
            ),
          ],
        );
      },
      separatorBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 10),
          child: AppBannerCard(
            imageLink: 'assets/jeans.jpg',
            title: 'FROM ONLINE STORE',
            subtitle: 'MEN\'S LIFESTYLE COLLECTION',
            content: '',
            onButtonPressed: () {},
          ),
        );
      },
    );
  }
}
