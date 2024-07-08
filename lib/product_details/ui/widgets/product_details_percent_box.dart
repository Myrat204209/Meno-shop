import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class ProductDetailsPercentBox extends StatelessWidget {
  const ProductDetailsPercentBox({
    super.key,
    required this.onSalePercent,
  });

  final double onSalePercent;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.starsColor,
      shape: ShapeBorderX.roundedRectangle(10),
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          // minWidth: 45,
          // minHeight: 45,
          maxHeight: 60,
          maxWidth: 50,
        ),
        child: Center(
          child: Text(
            '-${onSalePercent.toInt()}%',
            style: const AppTextStyle.text()
                .semiBold()
                .md()
                .withColor(AppColors.quaterniary),
          ),
        ),
      ),
    );
  }
}
