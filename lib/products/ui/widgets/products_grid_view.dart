// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:data_provider/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:meno_shop/products/products.dart';
import 'package:shimmer/shimmer.dart';

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
      padding: const EdgeInsets.all(AppSpacing.xs),
      sliver: SliverGrid.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.54,
          mainAxisSpacing: AppSpacing.lg,
          crossAxisSpacing: AppSpacing.xs,
        ),
        itemCount: products.length + (hasMoreContent ? 1 : 0),
        itemBuilder: (context, index) {
          if (index == products.length) {
            onLoadMore?.call();
            return Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: const SizedBox(),
            );
          }
          return ProductCard(product: products[index]);
        },
      ),
    );
  }
}
