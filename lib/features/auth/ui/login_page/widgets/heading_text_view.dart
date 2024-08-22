// HeadingText.dart
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class HeadingText extends StatelessWidget {
  const HeadingText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Telefon belginizi girizin!",
      style: const AppTextStyle.text().xl().bold(),
      textAlign: TextAlign.center,
    );
  }
}

