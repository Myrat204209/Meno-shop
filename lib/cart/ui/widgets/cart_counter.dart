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
      child: SizedBox(
        width: 110,
        height: 40,
        child: Row(
          children: [
            Expanded(child: CounterIcon(onCallBack: removeOneButton)),
            Expanded(
              child: Text(
                '$counterQuantity',
                textAlign: TextAlign.center,
                style: const AppTextStyle.text().lg().semiBold(),
              ),
            ),
            Expanded(child: CounterIcon(onCallBack: addOneButton, isAdd: true)),
          ],
        ),
      ),
    ).paddingOnly(right: 5);
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
      iconSize: 26,
      visualDensity: VisualDensity.compact,
      padding: EdgeInsets.zero,
      onPressed: () => onCallBack(),
      icon: Icon(
        isAdd ? Icons.add : Icons.remove,
        color: AppColors.primary,
      ),
    );
  }
}
