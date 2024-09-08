// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:data_provider/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:meno_shop/app/app.dart';
import 'package:meno_shop/constants/constants.dart';
import 'package:meno_shop/favorites/favorites.dart';
import 'package:meno_shop/l10n/l10n.dart';
import 'package:meno_shop/product/product.dart';

class ProductDetailsSimilarProducts extends StatelessWidget {
  const ProductDetailsSimilarProducts({
    super.key,
    required this.products,
  });
  final List<ProductItem>? products;
  @override
  Widget build(BuildContext context) {
    final favoriteBloc = context.read<FavoritesBloc>();

    final locale = context.l10n.localeName;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: AppSpacing.md),
        AppTitledWithViewAllRow(
          padding: 0,
          title: context.l10n.similarProducts,
          onViewAllTap: () => context.pushNamed(
            RouteNames.categoryProducts.name,
          ),
          viewAllText: context.l10n.viewAll,
        ),
        const SizedBox(height: AppSpacing.md),
        if (products != null)
          AppHorizontalListView(
            itemCount: products!.length,
            crossAxisAlignment: CrossAxisAlignment.start,
            separatorBuilder: (context, index) => const SizedBox(width: 10),
            itemBuilder: (context, index) {
              var product = products![index];
              if (products!.isNotEmpty) {
                return AppProductItem(
                  photoPath: product.photo != null && product.photo!.isNotEmpty
                      ? product.photo!.first.path!.fullPath()
                      : null,
                  name: product.name!.changeLocale(locale),
                  price: product.price!,
                  originalPrice: product.discounts?.originalPrice,
                  isFavorite: favoriteBloc.isFavorite(product.uuid!),
                  advantages: null,
                  onCartAdded: () {},
                  onFavoriteAdded: () =>
                      favoriteBloc.add(FavoriteButtonPressed(product.uuid!)),
                  onProductPressed: () {
                    context.read<ProductsBloc>().add(
                        ProductByUuidRequested(productUuid: product.uuid!));
                    context.pushNamed(
                      RouteNames.productDetails.name,
                      pathParameters: {'uuid': product.uuid!},
                    );
                  },
                );
              }

              return const SizedBox(child: Text('No available products'))
                  .centralize();
            },
          )
        else
          const Padding(padding: EdgeInsets.zero),
        const SizedBox(height: AppSpacing.lg)
      ],
    );
  }
}
