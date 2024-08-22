import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: SplashPage());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 100),
            Text(
              'Meno Logistics',
              style: theme.primaryTextTheme.headlineMedium?.copyWith(
                color: AppColors.quaterniary,
              ),
            ),
            const SizedBox(height: 100),
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
