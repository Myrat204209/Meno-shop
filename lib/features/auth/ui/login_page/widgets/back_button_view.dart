// BackButtonWidget.dart
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class BackButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;

  const BackButtonWidget({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: IconButton(
        onPressed: onPressed,
        icon: const Icon(Icons.arrow_back),
      ).paddingOnly(top: 5),
    );
  }
}