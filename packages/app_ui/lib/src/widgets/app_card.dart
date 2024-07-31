// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

/// App card
class AppCard extends StatelessWidget {
  /// Constructor
  const AppCard({
    super.key,
    this.onPressed,
    this.title,
    this.subtitle,
    this.trailing,
    this.leading,
    this.isThreeLine,
    this.onTap,
    this.onLongPressed,
  });

  final VoidCallback? onPressed;
  final Widget? leading;
  final Widget? title;
  final Widget? subtitle;
  final Widget? trailing;
  final bool? isThreeLine;
  final VoidCallback? onTap;
  final VoidCallback? onLongPressed;

  @override
  Widget build(BuildContext context) {
    return AppBorderColorBox(
      borderColor: AppColors.neutral.shade800,
      child: Material(
        shadowColor: Color(0xFFB5DCFF).withOpacity(0.15),
        elevation: 20,
        shape: ShapeBorderX.roundedRectangle(10),
        child: SizedBox(
          height: 135,
          width: 328,
          child: ListTile(
            leading: leading,
            title: title?.paddingOnly(bottom: 8),
            subtitle: subtitle?.paddingOnly(bottom: 3),
            trailing: trailing,
            onTap: onTap,
            onLongPress: onLongPressed,
            contentPadding: EdgeInsets.only(left: 10, top: 4),
            isThreeLine: isThreeLine == true,
            shape: ShapeBorderX.roundedRectangle(10),
          ),
        ),
      ),
    ).paddingSymmetric(vertical: 4, horizontal: 10);
  }
}
