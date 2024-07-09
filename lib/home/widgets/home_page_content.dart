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
        // const SliverPadding(padding: EdgeInsets.only(top: 10)),
        // const HomePageAppBar(),
        // const SliverPadding(padding: EdgeInsets.only(top: 10)),
        // if (banners.isNotEmpty)
        //   SliverToBoxAdapter(
        //     child: AppAdsBanner(banners: banners),
        //   )
        // else
        //   const SliverToBoxAdapter(
        //     child: SizedBox(height: AppSpacing.md),
        //   ),
        HomePageBannerCard(banners: banners),
        const HomePageMerch(),
        const SliverPadding(padding: EdgeInsets.only(bottom: 20)),
        SliverToBoxAdapter(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AppProductItem(
                image: Assets.images.jeans.extendPath(),
                price: 550,
                category: 'Accessories',
                label: 'Gold Watch',
              ),
              AppProductItem(
                image: Assets.images.jeans.extendPath(),
                price: 550,
                label: 'Accessories',
                category: 'Gold Watch',
              ),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AppProductItem(
                image: Assets.images.jeans.extendPath(),
                price: 550,
                category: 'Accessories',
                label: 'Gold Watch',
              ),
              AppProductItem(
                image: Assets.images.jeans.extendPath(),
                price: 550,
                label: 'Accessories',
                category: 'Gold Watch',
              ),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AppProductItem(
                image: Assets.images.jeans.extendPath(),
                price: 550,
                category: 'Accessories',
                label: 'Gold Watch',
              ),
              AppProductItem(
                image: Assets.images.jeans.extendPath(),
                price: 550,
                label: 'Accessories',
                category: 'Gold Watch',
              ),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AppProductItem(
                image: Assets.images.jeans.extendPath(),
                price: 550,
                category: 'Accessories',
                label: 'Gold Watch',
              ),
              AppProductItem(
                image: Assets.images.jeans.extendPath(),
                price: 550,
                label: 'Accessories',
                category: 'Gold Watch',
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
