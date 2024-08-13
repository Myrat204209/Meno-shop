// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:data_provider/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:meno_shop/app/app.dart';

import 'package:meno_shop/favorites/favorites.dart';

class ProductDetailsSimilarProducts extends StatelessWidget {
  const ProductDetailsSimilarProducts({
    super.key,
    required this.products,
  });
  final List<ProductItem?> products;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Similar Goods',
          style: const AppTextStyle.text().bold().xl(),
        ),
        const SizedBox(height: 10),
        AppHorizontalListView(
          itemCount: products.length,
          crossAxisAlignment: CrossAxisAlignment.start,
          itemBuilder: (context, index) {
            final product = products[index];
            return AppProductItem(
              onFavoriteAdded: () {
                context
                    .read<FavoritesBloc>()
                    .add(FavoriteButtonPressed(product));
              },
              image: product?.photo?.first.path,
              price: product!.price!,
              label: 'label',
              onTap: () {
                context.pushNamed(
                  RouteNames.productDetails.name,
                  pathParameters: {
                    'uuid': product.uuid!,
                  },
                );
              },
            );
          },
        ),
      ],
    );
  }
}
