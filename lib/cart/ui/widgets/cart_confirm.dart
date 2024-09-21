import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:meno_shop/l10n/l10n.dart';

class ConfirmCart extends StatelessWidget {
  const ConfirmCart({
    super.key,
    required this.onBottomRowTap,
    required this.totalPrice,
    required this.buttonText,
    required this.onButtonPressed,
  });

  final VoidCallback onBottomRowTap;
  final double totalPrice;
  final String buttonText;
  final VoidCallback onButtonPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onBottomRowTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(context.l10n.totalPrice),
              Text('$totalPrice TMT'),
            ],
          ),
          const Expanded(child: SizedBox.shrink()),
          AppButton(
            buttonText: buttonText,
            onTap: onButtonPressed,
            color: AppColors.secondary,
            textColor: AppColors.quaterniary,
          )
        ],
      ).paddingSymmetric(horizontal: 20),
    );
  }
}
