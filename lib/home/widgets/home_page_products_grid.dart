import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class HomePageProductsGrid extends StatelessWidget {
  const HomePageProductsGrid({
    super.key,
    required this.products,
  });

  final List<AppProductItem> products;

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      key: const Key('Products '),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const AppTitledWithViewAllRow(title: 'Select Products'),
            GridView.builder(
              shrinkWrap: true,
              itemCount: 4,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 320,
                mainAxisSpacing: 10,
                crossAxisSpacing: 20,
              ),
              itemBuilder: (context, index) {
                return products[index];
              },
            ),
          ],
        );
      },
      separatorBuilder: (context, index) {
        return AppBannerCard(
          imageLink: 'assets/jeans.jpg',
          title: 'FROM ONLINE STORE',
          subtitle: 'MEN\'S LIFESTYLE COLLECTION',
          content: '',
          onButtonPressed: () {},
        );
      },
    );
  }
}
