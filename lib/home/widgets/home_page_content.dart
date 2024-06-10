import 'package:app_ui/app_ui.dart';
import 'package:data_provider/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meno_shop/banner/banner.dart';
import 'package:meno_shop/home/home.dart';

class HomePageContent extends StatelessWidget {
  const HomePageContent({
    super.key,
    required this.products,
  });
  final List<AppProductItem> products;
  @override
  Widget build(BuildContext context) {
    // final categories = context.select((HomeBloc bloc) => bloc.state.categories);
    final banners = context.select((HomeBloc bloc) => bloc.state.banners);
    return CustomScrollView(
      // shrinkWrap: true,a
      slivers: [
        const HomePageAppBar(),
        // const HomePageBannerCard(),
        if (banners.isNotEmpty)
          SliverToBoxAdapter(
            child: AppAdsBanner(
              banners: banners.map<BannerItem>((banner) => banner).nonNulls,
            ),
          )
        else
          const SliverToBoxAdapter(
            child: SizedBox(height: AppSpacing.md),
          ),

        HomePageProductsList(
          products: products,
          title: 'Select Products',
        ),
        HomePageProductsList(
          title: 'Active Subcategories',
          products: products,
        ),
        HomePageProductsList(
          title: 'Latest Products',
          products: products,
        ),
        // HomePageProductsGrid(products: products),
      ],
    );
  }
}
