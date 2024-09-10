import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meno_shop/favorites/favorites.dart';
import 'package:meno_shop/products/products.dart';
import 'package:meno_shop/shimmer/shimmer.dart';

class FavoritesContent extends StatelessWidget {
  const FavoritesContent({super.key});

  @override
  Widget build(BuildContext context) {
    final favoritesBloc = context.read<FavoritesBloc>();
    final favorites =
        context.select((FavoritesBloc bloc) => bloc.state.products);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (favoritesBloc.state.status == FavoritesStatus.loading ||
            favoritesBloc.state.status == FavoritesStatus.updating)
          const FavoritesLoadingView(),
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
                        (favorite) => ProductCard(
                          product: favorite,

                          // photoPath: favorite.photo != null &&
                          //         favorite.photo!.isNotEmpty
                          //     ? favorite.photo!.first.path!.fullPath()
                          //     : null,
                        ),
                      )
                      .toList(),
                )
              : const Text('Halanlarymda haryt ýok').centralize(),
        ),
      ],
    ).paddingOnly(left: 10);
  }
}
