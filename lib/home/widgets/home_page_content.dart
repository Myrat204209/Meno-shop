import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meno_shop/home/home.dart';

class HomePageContent extends StatelessWidget {
  const HomePageContent({
    super.key,
    required this.products,
  });
  final List<AppProductItem> products;
  @override
  Widget build(BuildContext context) {
    final categories = context.select((HomeBloc bloc) => bloc.state.categories);
    // final isLoading = context
    //     .select((HomeBloc bloc) => bloc.state.status == HomeStatus.loading);
    // if (products.isEmpty ?? true) {
    //   return const SliverPadding(padding: EdgeInsets.zero);
    // }
    return CustomScrollView(
      // shrinkWrap: true,a
      slivers: [
        const HomePageBannerCard(),
        HomePageCategoriesList(
          categories: categories,
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
