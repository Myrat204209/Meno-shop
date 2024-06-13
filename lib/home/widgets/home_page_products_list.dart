// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:app_ui/app_ui.dart';
import 'package:data_provider/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:meno_shop/main/main.dart';

import 'package:meno_shop/product/ui/product_details/product_details.dart';

class HomePageProductsList extends StatelessWidget {
  const HomePageProductsList({
    super.key,
    required this.products,
    required this.title,
  });

  final List<ProductItem?>? products;
  final String? title;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTitledWithViewAllRow(
            title: title ?? '',
            padding: 10,
            onViewAllTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const ProductDetailsPage(),
            )),
          ),
          if (products != null)
            AppHorizontalListView(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemCount: products!.length,
              separatorBuilder: (context, index) => const SizedBox(width: 10),
              itemBuilder: (context, index) {
                var product = products![index];
                String imageUrl;
                if (product!.photo!.isNotEmpty) {
                  imageUrl = product.photo!.first.path!;
                } else {
                  imageUrl = '';
                }
                if (products!.isNotEmpty) {
                  return AppProductItem(
                    price: product.price!,
                    image: '$kDefaultBaseUrl\\$imageUrl',
                    label: ' ',
                    category: products![index]!.name!,
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ProductDetailsPage(),
                      ));
                    },
                  );
                }
                return const SizedBox();
              },
            )
          else
            const SliverPadding(padding: EdgeInsets.zero),
        ],
      ),
    );
  }
}
