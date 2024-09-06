import 'package:flutter/material.dart';
import 'package:meno_shop/shimmer/shimmer.dart';

class CategoryLoadingView extends StatelessWidget {
  const CategoryLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // physics: const NeverScrollableScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            for (int i = 0; i <= 6; i++) ...[
              const SmallPlaceholder(),
              const TextPlaceholder(),
              const SizedBox(height: 20)
            ]
          ],
        ),
      ),
    );
  }
}
