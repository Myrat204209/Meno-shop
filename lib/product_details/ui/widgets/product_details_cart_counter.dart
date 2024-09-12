// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ProductDetailsCartCounter extends HookWidget {
  const ProductDetailsCartCounter({
    super.key,
    required this.addOneButton,
    required this.removeOneButton,
    required this.counterQuantity,
  });
  final VoidCallback addOneButton;
  final VoidCallback removeOneButton;
  final int counterQuantity;
  @override
  Widget build(BuildContext context) {
    final quantity = useState(counterQuantity);
    return AppWrapper(
      borderColor: AppColors.neutral.shade300,
      child: SizedBox(
        width: 150,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                removeOneButton.call();
                if (quantity.value > 0) {
                  quantity.value--;
                }
              },
              icon: const Icon(
                Icons.remove,
                size: 30,
                color: AppColors.primary,
              ),
            ),
            Text(
              '${quantity.value}',
              style: const AppTextStyle.text().lg().semiBold(),
            ),
            IconButton(
              onPressed: () {
                addOneButton.call();
                quantity.value++;
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
