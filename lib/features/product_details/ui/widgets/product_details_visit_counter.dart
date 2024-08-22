import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class ProductDetailsVisitCounter extends StatelessWidget {
  const ProductDetailsVisitCounter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '2112',
          style: const AppTextStyle.text()
              .regular()
              .xs()
              .withColor(const Color(0xFF8F8F8F)),
        ),
        const SizedBox(width: 5),
        const Icon(
          Icons.remove_red_eye_outlined,
          color: Color(0xFF8F8F8F),
          size: 15,
        )
      ],
    ).paddingSymmetric(vertical: 10);
  }
}
