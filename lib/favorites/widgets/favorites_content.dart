import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meno_shop/favorites/favorites.dart';
import 'package:meno_shop/l10n/l10n.dart';

class FavoritesContent extends StatelessWidget {
  const FavoritesContent({super.key});

  @override
  Widget build(BuildContext context) {
    final favorites =
        context.select((FavoritesBloc bloc) => bloc.state.products);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //TODO: Replace with actual functionality for product items
        const SizedBox(height: AppSpacing.xlg),
        Expanded(
          child: GridView.count(
            crossAxisCount: 2,
            scrollDirection: Axis.vertical,
            childAspectRatio: 160 / 285,
            mainAxisSpacing: 15,
            crossAxisSpacing: 5,
            padding: EdgeInsets.zero,
            children: favorites
                .map(
                  (favorite) => AppProductItem(
                    onTap: () {},
                    onFavoriteAdded: () {
                      context
                          .read<FavoritesBloc>()
                          .add(FavoriteButtonPressed(favorite));
                    },
                    product: favorite,
                    onCartAdded: () {},
                    locale: context.l10n.localeName,
                  ),
                )
                .toList(),
          ),
        ),
      ],
    ).paddingOnly(left: 10);
  }
}
