import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class ProductDetailsSimilarProducts extends StatelessWidget {
  const ProductDetailsSimilarProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Similar Goods',
          style: const AppTextStyle.text().bold().xl(),
        ),
        const SizedBox(height: 10),
        AppHorizontalListView(
          itemCount: 4,
          crossAxisAlignment: CrossAxisAlignment.start,
          itemBuilder: (context, index) {
            return AppProductItem(
              image: 'image',
              price: 222,
              label: 'label',
              onTap: () {},
            );
          },
        ),
      ],
    );
  }
}
