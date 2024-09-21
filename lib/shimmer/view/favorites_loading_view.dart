import 'package:flutter/material.dart';
import 'package:meno_shop/shimmer/shimmer.dart';

class FavoritesLoadingView extends StatelessWidget {
  const FavoritesLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          ProductsPlaceholder(),
        ],
      ),
    );
  }
}
