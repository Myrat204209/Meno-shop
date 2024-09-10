// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:data_provider/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:meno_shop/products/products.dart';
import 'package:meno_shop/shimmer/shimmer.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({
    super.key,
    required this.products,
    this.hasMoreContent = false,
    this.onLoadMore,
  });

  final List<ProductItem> products;
  final bool hasMoreContent;
  final VoidCallback? onLoadMore;
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(AppSpacing.md),
      sliver: SliverGrid.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.51,
          mainAxisSpacing: AppSpacing.md,
          crossAxisSpacing: AppSpacing.md,
        ),
        itemCount: products.length + (hasMoreContent ? 1 : 0),
        itemBuilder: (context, index) {
          if (index == products.length) {
            onLoadMore?.call();
            return const ProductsPlaceholder();
          }
          return ProductCard(product: products[index]);
        },
      ),
    );
  }
}
