import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:meno_shop/app/app.dart';
import 'package:meno_shop/constants/constants.dart';
import 'package:meno_shop/favorites/favorites.dart';
import 'package:meno_shop/l10n/l10n.dart';

class FavoritesContent extends StatelessWidget {
  const FavoritesContent({super.key});

  @override
  Widget build(BuildContext context) {
    final favoritesBloc = context.read<FavoritesBloc>();
    final favorites =
        context.select((FavoritesBloc bloc) => bloc.state.products);

    final locale = context.l10n.localeName;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: AppSpacing.xlg),
        Expanded(
          child: favorites.isNotEmpty
              ? GridView.count(
                  crossAxisCount: 2,
                  scrollDirection: Axis.vertical,
                  childAspectRatio: 160 / 285,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 5,
                  padding: EdgeInsets.zero,
                  children: favorites
                      .map(
                        (favorite) => AppProductItem(
                          onProductPressed: () {
                            context.pushNamed(
                              RouteNames.productDetails.name,
                              extra: favorite,
                            );
                          },
                          onFavoriteAdded: () {
                            favoritesBloc
                                .add(FavoriteButtonPressed(favorite.uuid!));
                          },
                          onCartAdded: null,
                          photoPath: favorite.photo != null &&
                                  favorite.photo!.isNotEmpty
                              ? favorite.photo!.first.path!.fullPath()
                              : null,
                          name: favorite.name!.changeLocale(locale),
                          price: favorite.price!,
                          originalPrice: favorite.discounts?.originalPrice,
                          advantages: favorite.advantages,
                          isFavorite: true,
                        ),
                      )
                      .toList(),
                )
              : const SizedBox(),
        ),
      ],
    ).paddingOnly(left: 10);
  }
}
