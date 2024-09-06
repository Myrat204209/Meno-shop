import 'package:flutter/material.dart';
import 'package:meno_shop/shimmer/shimmer.dart';

class FavoritesLoadingView extends StatelessWidget {
  const FavoritesLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          for (int i = 0; i < 10; i++) const ProductsPlaceholder(),
        ],
      ),
    );
  }
}
