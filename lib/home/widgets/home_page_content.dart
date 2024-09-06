// import 'package:app_ui/app_ui.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meno_shop/constants/constants.dart';
import 'package:meno_shop/favorites/favorites.dart';

import 'package:meno_shop/home/home.dart';
import 'package:meno_shop/l10n/l10n.dart';
import 'package:meno_shop/shimmer/shimmer.dart';

class HomePageContent extends StatelessWidget {
  const HomePageContent({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final subcategories =
        context.select((HomeBloc bloc) => bloc.state.subcategories);

    final banners = context.select((HomeBloc bloc) => bloc.state.banners);
    final locale = context.l10n.localeName;
    return BlocConsumer<FavoritesBloc, FavoritesState>(
      listener: (context, state) {},
      builder: (context, state) {
        return CustomScrollView(
          slivers: [
            const SliverPadding(padding: EdgeInsets.only(top: 10)),
            if (banners.isNotEmpty) ...[
              HomePageBannerCard(banners: banners),
              const HomePageMerch()
            ] else ...[
              const SliverToBoxAdapter(child: BigPlaceholder()),
              const SliverToBoxAdapter(child: MiddlePlaceholder())
            ],
            const SliverPadding(padding: EdgeInsets.only(bottom: 20)),
            if (subcategories.isEmpty)
              for (int i = 0; i < 3; i++)
                const SliverToBoxAdapter(child: ProductsPlaceholder()),
            for (var subcategory in subcategories)
              if (subcategory.products != [] &&
                  subcategory.products!.isNotEmpty)
                HomePageProductsList(
                  products: subcategory.products,
                  title: subcategory.name!.changeLocale(locale),
                ),
          ],
        );
      },
    );
  }
}
