import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class CategoryActionButton extends StatelessWidget {
  const CategoryActionButton({
    super.key,
    required this.onPressed,
  });
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return AppActionsButton(
      onPressed: onPressed,
      backgroundColor: UIColors.quaterniary,
      iconColor: UIColors.neutral.shade700,
      icon: Icons.ad_units,
    );
  }
}
