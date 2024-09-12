// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:app_ui/app_ui.dart';
import 'package:data_provider/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:meno_shop/app/app.dart';
import 'package:meno_shop/products/products.dart';

class HomePageProductsList extends StatelessWidget {
  const HomePageProductsList({
    super.key,
    required this.products,
    required this.title,
    required this.subcategoryName,
    required this.categoryName,
  });

  final List<ProductItem>? products;
  final String? title;
  final String subcategoryName;
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProductsViewAll(
            title: title ?? '',
            padding: 10,
            onViewAllTap: () {
              context
                ..read<ProductsBloc>().add(ProductsRequested(
                    subcategoryId: products!.first.subcategoryId!))
                ..pushNamed(
                  RouteNames.products.name,
                  pathParameters: {'uuid': products!.first.subcategoryId!},
                  // extra: [categoryName, subcategoryName],
                );
            },
          ),
          const SizedBox(height: AppSpacing.md),
          if (products != null)
            AppHorizontalListView(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemCount: products!.length,
              separatorBuilder: (context, index) => const SizedBox(width: 10),
              itemBuilder: (context, index) {
                var product = products![index];

                if (products!.isNotEmpty) {
                  return ProductCard(product: product);
                }
                return const SizedBox(
                  child: Text('No available products'),
                ).centralize();
              },
            )
          else
            const Padding(padding: EdgeInsets.zero),
          const SizedBox(height: AppSpacing.lg),
        ],
      ),
    );
  }
}
