import 'package:flutter/material.dart';
import 'package:meno_shop/shimmer/shimmer.dart';

class CartLoadingView extends StatelessWidget {
  const CartLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            for (int i = 0; i < 4; i++) const MiddlePlaceholder(),
          ],
        ),
      ),
    );
  }
}
