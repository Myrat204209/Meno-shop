import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class AppDefaultLabelTextWidget extends StatelessWidget {
  const AppDefaultLabelTextWidget({
    super.key,
    required this.label,
  });
  final String label;
  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: UITextStyle.headline4.copyWith(
        color: UIColors.primary,
        fontSize: 20,
      ),
    );
  }
}
