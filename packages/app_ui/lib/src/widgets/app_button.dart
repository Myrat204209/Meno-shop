// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    required this.buttonText,
    required this.onTap,
    this.icon,
    this.color,
    this.textColor,
  }) : width = 130;
  const AppButton.expanded({
    super.key,
    required this.buttonText,
    required this.onTap,
    this.icon,
    this.color,
    this.textColor,
  }) : width = double.infinity;
  const AppButton.icon({
    this.buttonText,
    required this.onTap,
    this.icon = const Icon(
      Icons.shopping_bag_outlined,
      color: AppColors.quaterniary,
    ),
    this.color,
    this.textColor,
  }) : width = 45;
  const AppButton.standard({
    required this.buttonText,
    required this.onTap,
    required this.icon,
    this.color,
    this.textColor,
  }) : width = 200;
  final String? buttonText;
  final VoidCallback? onTap;
  final Icon? icon;
  final double? width;
  final Color? color;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: color,
      disabledColor: AppColors.neutral.shade500,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 9),
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
            style: AppTextStyle.text().medium().withColor(textColor),
          ),
        ],
      ).centralize(),
    );
  }
}
