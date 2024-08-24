// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:data_provider/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:meno_shop/app/app.dart';
import 'package:meno_shop/cart/cart.dart';

import 'package:meno_shop/favorites/favorites.dart';
import 'package:meno_shop/l10n/l10n.dart';

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
                    .add(AddFavoriteRequested(product));
              },
              onTap: () {
                context.pushNamed(
                  RouteNames.productDetails.name,
                  pathParameters: {'uuid': product.uuid!},
                );
              },
              product: product!,
              onCartAdded: () {
                context.read<CartBloc>().add(CartUpdateRequested(
                    CartItem(id: product.uuid!, quantity: 1)));
              },
              locale: context.l10n.localeName,
            );
          },
        ),
      ],
    );
  }
}
