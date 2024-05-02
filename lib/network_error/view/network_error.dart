import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

/// {@template network_error}
/// A network error alert.
/// {@endtemplate}

class NetworkError extends StatelessWidget {
  /// {@macro network_error}
  const NetworkError({super.key, this.onRetry});

  /// An optional callback which is invoked when the retry button is pressed.
  final VoidCallback? onRetry;

  /// Route constructor to display the widget inside a [Scaffold].
  static Route<void> route({VoidCallback? onRetry}) {
    return PageRouteBuilder<void>(
      pageBuilder: (_, __, ___) => Scaffold(
        backgroundColor: UIColors.quaterniary,
        body: Center(
          child: NetworkError(onRetry: onRetry),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Gap(AppSpacing.xlg),
        const Icon(
          Icons.error_outline,
          size: 80,
          color: UIColors.secondary,
        ),
        const Text(
          'Network error',
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: AppSpacing.lg),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xxxlg),
          child: AppButton(
            onTap: onRetry,
            type: AppButtonType.standard,
            text: 'Network Error',
          ),
        ),
        const Gap(AppSpacing.xlg),
      ],
    );
  }
}
