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
    final favorites =
        context.select((FavoritesBloc bloc) => bloc.state.favorites);

    return BlocBuilder<FavoritesBloc, FavoritesState>(
      // listener: (context, state) => state.favorites,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (state.status == FavoritesStatus.loading ||
                state.status == FavoritesStatus.updating)
              const FavoritesLoadingView()
            else if (state.status == FavoritesStatus.success ||
                state.status == FavoritesStatus.updatingSuccess)
              Expanded(
                  child: favorites.isNotEmpty
                      ? GridView.count(
                          crossAxisCount: 2,
                          scrollDirection: Axis.vertical,
                          childAspectRatio: 160 / 285,
                          mainAxisSpacing: 15,
                          crossAxisSpacing: 10,
                          children: favorites
                              .map(
                                (favorite) => ProductCard(
                                  product: favorite,
                                ),
                              )
                              .toList(),
                        )
                      : const SizedBox.shrink())
            else
              const Text('Halanlarymda haryt ýok').centralize(),
          ],
        );
      },
    ).paddingSymmetric(horizontal: 10);
  }
}
