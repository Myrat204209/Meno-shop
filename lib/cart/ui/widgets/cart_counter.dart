import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CartCounter extends HookWidget {
  const CartCounter({
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
      expand: 1,
      child: SizedBox(
        width: 118,
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                removeOneButton.call();
                if (quantity.value > 0) {
                  quantity.value--;
                } else {
                  quantity.value = 0;
                }
              },
              icon: const Icon(
                Icons.remove,
                size: 25,
                color: AppColors.primary,
              ),
            ),
            Text(
              '${quantity.value}',
              style: const AppTextStyle.text().md().semiBold(),
            ),
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                addOneButton.call();

                quantity.value++;
              },
              icon: const Icon(
                Icons.add,
                size: 25,
                color: AppColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
