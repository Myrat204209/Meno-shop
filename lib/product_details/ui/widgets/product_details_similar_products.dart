// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:data_provider/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meno_shop/app/app.dart';
import 'package:meno_shop/l10n/l10n.dart';
import 'package:meno_shop/products/products.dart';

class ProductDetailsSimilarProducts extends StatelessWidget {
  const ProductDetailsSimilarProducts({
    super.key,
    required this.products,
  });
  final List<ProductItem>? products;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: AppSpacing.md),
        ProductsViewAll(
          padding: 0,
          title: context.l10n.similarProducts,
          onViewAllTap: () => context.pushNamed(
            RouteNames.products.name,
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        if (products != null)
          AppHorizontalListView(
            itemCount: products!.length,
            crossAxisAlignment: CrossAxisAlignment.start,
            separatorBuilder: (context, index) => const SizedBox(width: 10),
            itemBuilder: (context, index) {
              var product = products![index];
              if (products!.isNotEmpty) {
                return ProductCard(product: product);
              }

              return const SizedBox(child: Text('No available products'))
                  .centralize();
            },
          )
        else
          const Padding(padding: EdgeInsets.zero),
        const SizedBox(height: AppSpacing.lg)
      ],
    );
  }
}
