// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

enum AppButtonType {
  expanded,
  standard,
  action,
  icon;
}

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.type,
    required this.buttonText,
    required this.onTap,
    this.icon,
  });
  final AppButtonType type;
  final String? buttonText;
  final VoidCallback? onTap;
  final Icon? icon;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: AppColors.secondary,
      minWidth: type == AppButtonType.expanded ? double.infinity : 160,
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      shape: ShapeBorderX.roundedRectangle(10),
      onPressed: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          icon ?? SizedBox(),
          Text(
            buttonText!,
            style: AppTextStyle.text()
                .medium()
                .regular()
                .withColor(AppColors.quaterniary),
          ),
        ],
      ).centralize(),
    );
  }
}
