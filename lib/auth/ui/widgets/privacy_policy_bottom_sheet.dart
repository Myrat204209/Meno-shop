import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

Future<void> showPrivacyPolicyBottomSheet({
  required BuildContext context,
}) async =>
    showModalBottomSheet(
      context: context,
      useSafeArea: true,
      isScrollControlled: true,
      builder: (_) => const PrivacyPolicyBottomSheet(),
    );

class PrivacyPolicyBottomSheet extends StatelessWidget {
  const PrivacyPolicyBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppBottomSheet(
      bottomModalChildren: [],
    );
  }
}
