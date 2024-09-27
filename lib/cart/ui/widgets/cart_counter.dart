import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class CartCounter extends StatelessWidget {
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
    return AppWrapper(
      borderColor: AppColors.neutral.shade300,
      expand: 1,
      child: SizedBox(
        width: 118,
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CounterIcon(onCallBack: removeOneButton),
            Text(
              '$counterQuantity',
              style: const AppTextStyle.text().lg().semiBold(),
            ),
            CounterIcon(onCallBack: addOneButton, isAdd: true),
          ],
        ),
      ),
    );
  }
}

class CounterIcon extends StatelessWidget {
  const CounterIcon({
    super.key,
    required this.onCallBack,
    this.isAdd = false,
  });

  final VoidCallback onCallBack;
  final bool isAdd;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      onPressed: () => onCallBack(),
      icon: Icon(
        isAdd ? Icons.add : Icons.remove,
        size: 28,
        color: AppColors.primary,
      ),
    );
  }
}
