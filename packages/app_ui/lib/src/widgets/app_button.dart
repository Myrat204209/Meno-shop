// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

enum AppButtonType {
  large(120),
  standard(30),
  iconed(40),
  small(10);

  final double padding;
  const AppButtonType(this.padding);
}

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.type,
    required this.text,
    required this.onTap,
    this.icon = Icons.shopping_bag_outlined,
  });
  final AppButtonType type;
  final String? text;
  final VoidCallback? onTap;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(10),
      color: UIColors.secondary,
      child: InkWell(
        splashColor: UIColors.secondary,
        borderRadius: BorderRadius.circular(10),
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: type.padding,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (type == AppButtonType.iconed)
                Icon(
                  icon,
                  color: UIColors.quaterniary,
                ),
              Gap(
                AppButtonType.small == type ? 0 : 10,
              ),
              if (type != AppButtonType.small)
                Text(
                  text!,
                  style: UITextStyle.headline6.copyWith(
                    color: UIColors.quaterniary,
                  ),
                )
              else
                Icon(
                  icon,
                  color: UIColors.quaterniary,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
