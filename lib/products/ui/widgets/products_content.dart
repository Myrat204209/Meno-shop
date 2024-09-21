// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:meno_shop/products/products.dart';

class ProductsContent extends StatelessWidget {
  const ProductsContent({
    super.key,
    this.category,
    this.subcategoryId,
    this.subcategory,
  });

  final String? category;
  final String? subcategoryId;
  final String? subcategory;

  @override
  Widget build(BuildContext context) {
    final (products, hasMoreContent) = context.select(
      (ProductsBloc bloc) => (bloc.state.products, bloc.state.hasMoreContent),
    );
    return Stack(
      fit: StackFit.expand,
      children: [
        ProductsRefreshIndicator(
          child: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(child: SizedBox(height: AppSpacing.xs)),
              ProductsGridView(
                products: products,
                hasMoreContent: hasMoreContent,
                onLoadMore: () => context
                    .read<ProductsBloc>()
                    .add(ProductsRequested(subcategoryId: subcategoryId)),
              )
            ],
          ),
        ),
        if (products.isEmpty && !hasMoreContent)
          const SizedBox(
            child: Text('no other products'),
          ).centralize()
        // Text('$category / $subcategory'),
        // Text(
        //   '',
        //   style: const AppTextStyle.text()
        //       .lg()
        //       .bold()
        //       .withColor(AppColors.primary),
        // ),
        // const SizedBox(height: AppSpacing.xlg),
        // Flexible(
        //   child: GridView.count(
        //     crossAxisCount: 2,
        //     scrollDirection: Axis.vertical,
        //     childAspectRatio: 160 / 285,
        //     mainAxisSpacing: 15,
        //     crossAxisSpacing: 5,
        //     padding: EdgeInsets.zero,
        //     children: [
        //       ProductCard(
        //         onProductPressed: () {
        //           context.pushNamed(
        //             RouteNames.productDetails.name,
        //             pathParameters: {'uuid': 'productDetailsasdmlks'},
        //           );
        //         },
        //         product: null,
        //       ),
        //     ],
        //   ),
        // ),
      ],
    );
  }
}
