// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class AppBottomSheet extends StatelessWidget {
  const AppBottomSheet({
    super.key,
    required this.bottomModalChildren,
  });
  final List<Widget> bottomModalChildren;
  static Future<void> show({
    required BuildContext context,
    required Widget bottomModalChildren,
    bool? useRootNavigator,
  }) async {
    return showModalBottomSheet(
      context: context,
      useSafeArea: true,
      useRootNavigator: useRootNavigator ?? true,
      isScrollControlled: true,
      builder: (_) => AppBottomSheet(
        bottomModalChildren: [bottomModalChildren],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.lg,
      ).copyWith(
        bottom: MediaQuery.of(context).viewInsets.bottom + AppSpacing.lg,
      ),
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: bottomModalChildren,
      ),
    ).paddingOnly(bottom: 50);
  }
}
