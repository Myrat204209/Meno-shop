import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class FavoritesContent extends StatelessWidget {
  const FavoritesContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //TODO: Replace with actual functionality for product items
        const SizedBox(height: AppSpacing.xlg),
        Expanded(
          child: GridView.count(
            crossAxisCount: 2,
            scrollDirection: Axis.vertical,
            childAspectRatio: 160 / 285,
            mainAxisSpacing: 15,
            crossAxisSpacing: 5,
            padding: EdgeInsets.zero,
            children: [
              //TODO: Replace with actual product items
              AppProductItem(
                image: Assets.images.jeans.path,
                price: 550,
                label: 'T-Shirt',
                onTap: () {},
              ),
              AppProductItem(
                image: Assets.images.jeans.path,
                price: 550,
                label: 'T-Shirt',
                onTap: () {},
              ),
            ],
          ),
        ),
      ],
    ).paddingOnly(left: 10);
  }
}
