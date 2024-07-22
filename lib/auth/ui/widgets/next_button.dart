import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  const NextButton({required this.onPressed, super.key});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return AppButton(
      onTap: onPressed,
      buttonText: 'Dowam et',
    );
  }
}
