// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meno_shop/product_details/product_details.dart';
import 'package:meno_shop/shimmer/shimmer.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({
    super.key,
    required this.uuid,
  });

  final String uuid;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
      buildWhen: (previous, current) => previous.product != current.product,
      builder: (context, state) {
        if (state.status == ProductDetailsStatus.loading) {
          const ProductDetailsLoadingView();
        }
        if (state.status == ProductDetailsStatus.populated) {
          final product = state.product!;
          return ProductDetailsContent(
            product: product,
          );
        }
        return const SizedBox.shrink();
        // return const Center(child: Text('Haryt tapylmady.'));
      },
    );
  }
}
