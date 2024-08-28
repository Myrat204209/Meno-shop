
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class CartBottomActionRow extends StatelessWidget {
  const CartBottomActionRow({
    super.key,
    required this.onBottomRowTap,
    required this.onButtonPressed,
    required this.totalPrice,
    required this.buttonText,
  });
  final VoidCallback onBottomRowTap;
  final VoidCallback onButtonPressed;
  final double totalPrice;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onBottomRowTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(Icons.keyboard_arrow_down_outlined)
              .paddingSymmetric(vertical: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Total price'),
              Text('$totalPrice TMT'),
            ],
          ),
          const Expanded(child: SizedBox()),
          AppButton(
            buttonText: buttonText,
            onTap: onButtonPressed,
          )
        ],
      ).paddingSymmetric(horizontal: 10),
    );
  }
}