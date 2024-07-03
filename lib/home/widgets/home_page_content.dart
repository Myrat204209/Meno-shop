import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:meno_shop/banner/banner.dart';
import 'package:meno_shop/home/home.dart';

class HomePageContent extends StatelessWidget {
  const HomePageContent({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final subcategories =
        context.select((HomeBloc bloc) => bloc.state.subcategories);
    final banners = context.select((HomeBloc bloc) => bloc.state.banners);

    return CustomScrollView(
      slivers: [
        const SliverPadding(padding: EdgeInsets.only(top: 10)),
        const HomePageAppBar(),
        const SliverPadding(padding: EdgeInsets.only(top: 10)),
        // if (banners.isNotEmpty)
        //   SliverToBoxAdapter(
        //     child: AppAdsBanner(banners: banners),
        //   )
        // else
        //   const SliverToBoxAdapter(
        //     child: SizedBox(height: AppSpacing.md),
        //   ),
        HomePageBannerCard(banners: banners),
        const HomePageCenterBanner(),

        SliverToBoxAdapter(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AppProductItem(
                image: Assets.images.jeans.extendPath(),
                price: 112,
                label: 'asdas',
                category: 'asdasd',
              ),
              const AppProductItem(
                image: 'assets/jeans.jpg',
                price: 112,
                label: 'asdas',
                category: 'asdasd',
              ),
            ],
          ),
        ),
        const SliverPadding(padding: EdgeInsets.symmetric(vertical: 20)),
        SliverToBoxAdapter(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AppProductItem(
                image: Assets.images.jeans.extendPath(),
                price: 112,
                label: 'asdas',
                category: 'asdasd',
              ),
              AppProductItem(
                image: Assets.images.jeans.extendPath(),
                price: 112,
                label: 'asdas',
                category: 'asdasd',
              ),
            ],
          ),
        ),
        for (var subcategory in subcategories)
          HomePageProductsList(
            products: subcategory.products,
            title: subcategory.name,
          ),
      ],
    );
  }
}
