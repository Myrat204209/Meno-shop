import 'package:flutter/material.dart';
import 'package:app_ui/app_ui.dart';

class OtpTimer extends StatelessWidget {
  final int start;
  final String Function(int) formatTime;

  const OtpTimer({super.key, required this.start, required this.formatTime});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        formatTime(start),
        style: const AppTextStyle.text().sm().withColor(AppColors.secondary),
      ),
    );
  }
}
