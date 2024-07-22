// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.buttonText,
    required this.onTap,
    this.icon,
  }) : width = 130;
  const AppButton.expanded({
    super.key,
    required this.buttonText,
    required this.onTap,
    this.icon,
  }) : width = double.infinity;
  const AppButton.icon({
    this.buttonText,
    required this.onTap,
    this.icon = const Icon(
      Icons.shopping_bag_outlined,
      color: AppColors.quaterniary,
    ),
  }) : width = 45;
  const AppButton.standard({
    required this.buttonText,
    required this.onTap,
    required this.icon,
  }) : width = 200;
  final String? buttonText;
  final VoidCallback onTap;
  final Icon? icon;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: AppColors.secondary,
      padding: EdgeInsets.symmetric(horizontal: 21, vertical: 18),
      shape: ShapeBorderX.roundedRectangle(10),
      minWidth: width,
      onPressed: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (icon != null) icon!,
          if (icon != null && buttonText != null) SizedBox(width: 10),
          Text(
            buttonText ?? '',
            style:
                AppTextStyle.text().medium().withColor(AppColors.quaterniary),
          ),
        ],
      ).centralize(),
    );
  }
}
