// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:app_ui/app_ui.dart';
import 'package:data_provider/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:meno_shop/app/app.dart';
import 'package:meno_shop/favorites/favorites.dart';
import 'package:meno_shop/l10n/l10n.dart';

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
            onViewAllTap: () =>
                context.pushNamed(RouteNames.categoryProducts.name),
            viewAllText: context.l10n.viewAll,
          ),
          const SizedBox(height: 10),
          if (products != null)
            AppHorizontalListView(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemCount: products!.length,
              separatorBuilder: (context, index) => const SizedBox(width: 10),
              itemBuilder: (context, index) {
                var product = products![index];

                if (products!.isNotEmpty && product != null) {
                  return AppProductItem(
                    onFavoriteAdded: () {
                      context
                          .read<FavoritesBloc>()
                          .add(FavoriteButtonPressed(product));
                    },
                    // image: '$kDefaultBaseUrl\\$imageUrl',
                    onTap: () {
                      context.goNamed(
                        RouteNames.productDetails.name,
                        pathParameters: {'uuid': "asasas"},
                      );
                    },
                    product: product,
                    onCartAdded: () {},
                    locale: context.l10n.localeName,
                  );
                }
                return const SizedBox(
                  child: Text('No available products'),
                ).centralize();
              },
            )
          else
            const SliverPadding(padding: EdgeInsets.zero),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
