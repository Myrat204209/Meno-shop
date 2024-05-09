// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

/// A small, circular action button for use within a widget's action parameter.
class AppActionsButton extends StatelessWidget {
  const AppActionsButton({
    super.key,
    required this.onPressed,
    this.backgroundColor,
    this.iconColor = UIColors.quaterniary,
    required this.icon,
  });

  /// A callback function that is called when the button is pressed.
  final VoidCallback onPressed;

  /// The background color of the button. Defaults to a neutral shade 700 if not specified.
  final Color? backgroundColor;

  /// The color of the icon displayed on the button. Defaults to UIColors.quaterniary.
  final Color iconColor;

  /// The IconData to be displayed as the button's icon.
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: MaterialButton(
        minWidth: 45,
        height: 45,
        padding: EdgeInsets.zero,
        color: backgroundColor ?? UIColors.neutral.shade700,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Icon(
          icon,
          size: 32,
          color: iconColor,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
