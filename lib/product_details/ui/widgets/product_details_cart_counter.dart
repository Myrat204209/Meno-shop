import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class ProductDetailsCartCounter extends StatelessWidget {
  const ProductDetailsCartCounter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBorderColorBox(
      borderColor: AppColors.neutral.shade300,
      child: SizedBox(
        width: 150,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  //TODO: Remove product from cart
                },
                icon: const Icon(
                  Icons.remove,
                  size: 30,
                  color: AppColors.primary,
                )),
            Text(
              '1',
              style: const AppTextStyle.text().lg().semiBold(),
            ),
            IconButton(
              onPressed: () {
                //TODO: Add product from cart
              },
              icon: const Icon(
                Icons.add,
                size: 30,
                color: AppColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
