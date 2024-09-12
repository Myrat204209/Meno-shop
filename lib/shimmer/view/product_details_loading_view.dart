import 'package:flutter/material.dart';
import 'package:meno_shop/shimmer/shimmer.dart';

class ProductDetailsLoadingView extends StatelessWidget {
  const ProductDetailsLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          BigPlaceholder(),
          TextPlaceholder(),
          MiddlePlaceholder(),
          TextPlaceholder(),
          TextPlaceholder(),
          MiddlePlaceholder(),
        ],
      ),
    );
  }
}
