// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

import 'package:meno_shop/language/widgets/language_svg_icon.dart';

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
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 5,
      ),
      child: RadioListTile.adaptive(
        title: title,
        value: value,
        groupValue: groupValue,
        onChanged: onChanged,
        toggleable: true,
        shape: ShapeBorderX.roundedRectangle(10, AppColors.neutral.shade800),
        activeColor: AppColors.secondary2,
        controlAffinity: ListTileControlAffinity.trailing,
        secondary: svgPictureFromAsset(languageName),

        contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 1),
        // trailing: const Icon(Icons.circle_outlined),
      ),
    );
  }
}
