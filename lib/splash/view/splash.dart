import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: SplashPage());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: UIColors.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 100.h),
            Text(
              'Meno Logistics',
              style: theme.primaryTextTheme.headlineMedium?.copyWith(
                color: UIColors.quaterniary,
              ),
            ),
            SizedBox(height: 100.h),
            Text(
              '.Shop',
              style: theme.primaryTextTheme.titleLarge,
            ),
          ],
        ),
      ),
    );
  }
}
