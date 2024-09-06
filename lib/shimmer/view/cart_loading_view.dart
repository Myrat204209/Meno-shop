import 'package:flutter/material.dart';
import 'package:meno_shop/shimmer/shimmer.dart';

class CartLoadingView extends StatelessWidget {
  const CartLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          const TextPlaceholder(),
          for (int i = 0; i < 10; i++) const MiddlePlaceholder(),
        ],
      ),
    );
  }
}
