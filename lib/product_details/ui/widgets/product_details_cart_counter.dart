// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class ProductDetailsCartCounter extends StatelessWidget {
  const ProductDetailsCartCounter({
    super.key,
    required this.addOneButton,
    required this.removeOneButton,
    required this.quantity,
  });
  final VoidCallback addOneButton;
  final VoidCallback removeOneButton;
  final int quantity;
  @override
  Widget build(BuildContext context) {
    return AppWrapper(
      borderColor: AppColors.neutral.shade300,
      child: SizedBox(
        width: 150,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: removeOneButton,
              icon: const Icon(
                Icons.remove,
                size: 30,
                color: AppColors.primary,
              ),
            ),
            Text(
              '$quantity',
              style: const AppTextStyle.text().lg().semiBold(),
            ),
            IconButton(
              onPressed: addOneButton,
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
