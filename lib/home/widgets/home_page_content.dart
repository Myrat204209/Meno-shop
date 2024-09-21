// import 'package:app_ui/app_ui.dart';

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meno_shop/constants/constants.dart';

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
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return CustomScrollView(
          slivers: [
            const SliverPadding(padding: EdgeInsets.only(top: 10)),
            if (state.bannerStatus == HomeStatus.loading) ...[
              const SliverToBoxAdapter(child: BigPlaceholder()),
              const SliverToBoxAdapter(child: MiddlePlaceholder()),
            ] else if (state.bannerStatus == HomeStatus.populated) ...[
              HomePageBannerCard(banners: banners),
              const HomePageMerch()
            ] else
              const SliverPadding(padding: EdgeInsets.zero),
            const SliverPadding(padding: EdgeInsets.only(bottom: 20)),
            if (state.status == HomeStatus.loading)
              for (int i = 0; i < 3; i++)
                const SliverToBoxAdapter(child: ProductsPlaceholder())
            else if (state.status == HomeStatus.populated) ...[
              for (var subcategory in subcategories)
                if (subcategory.products != [] &&
                    subcategory.products!.isNotEmpty)
                  HomePageProductsList(
                    products: subcategory.products,
                    title: subcategory.name!.changeLocale(locale),
                    subcategoryName: subcategory.name!.changeLocale(locale),
                    categoryName:
                        subcategory.category?.name!.changeLocale(locale) ??
                            'categoryName',
                  )
            ] else
              SliverToBoxAdapter(
                child: Text(
                  'Harytlarynyz tapylmady',
                  style: const AppTextStyle.text().bodyText2().bold(),
                ).centralize().paddingOnly(top: 50),
              ),
          ],
        );
      },
    );
  }
}
