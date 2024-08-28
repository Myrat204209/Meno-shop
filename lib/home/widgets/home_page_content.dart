// import 'package:app_ui/app_ui.dart';

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meno_shop/constants/constants.dart';

import 'package:meno_shop/home/home.dart';
import 'package:meno_shop/l10n/l10n.dart';

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

    return CustomScrollView(
      slivers: [
        const SliverPadding(padding: EdgeInsets.only(top: 10)),
        if (banners.isEmpty) HomePageBannerCard(banners: banners),
        const HomePageMerch(),
        const SliverPadding(padding: EdgeInsets.only(bottom: 20)),
        if (subcategories.isEmpty)
          SliverToBoxAdapter(
              child: const CircularProgressIndicator.adaptive().centralize()),
        for (var subcategory in subcategories)
          if (subcategory.products != [] && subcategory.products!.isNotEmpty)
            HomePageProductsList(
              products: subcategory.products,
              title: subcategory.name!.changeLocale(locale),
            ),
      ],
    );
  }
}
