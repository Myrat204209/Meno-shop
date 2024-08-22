// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

import 'package:meno_shop/features/language/widgets/language_svg_icon.dart';

class LanguageListTile extends StatelessWidget {
  const LanguageListTile({
    super.key,
    this.onChanged,
    required this.languageName,
    required this.title,
    required this.value,
    required this.groupValue,
  });
  final Function(String?)? onChanged;
  final String languageName;
  final Widget title;
  final String value;
  final String groupValue;
  @override
  Widget build(BuildContext context) {
    return RadioListTile.adaptive(
      title: title,
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
      toggleable: true,
      shape: ShapeBorderX.roundedRectangle(
        10,
        value == groupValue ? AppColors.secondary : AppColors.neutral.shade800,
      ),
      tileColor: value == groupValue
          ? AppColors.secondary.withOpacity(0.05)
          : AppColors.quaterniary,
      activeColor: AppColors.secondary2,
      controlAffinity: ListTileControlAffinity.trailing,
      secondary: svgPictureFromAsset(languageName),
      visualDensity: const VisualDensity(
        horizontal: VisualDensity.minimumDensity,
        vertical: VisualDensity.minimumDensity,
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 4,
      ),
      // trailing: const Icon(Icons.circle_outlined),
    ).paddingSymmetric(
      vertical: 5,
    );
  }
}
