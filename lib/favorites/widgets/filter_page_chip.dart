import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class FilterPageChip extends StatelessWidget {
  const FilterPageChip({
    super.key,
    required this.isSelected,
    required this.label,
  });
  final bool isSelected;
  final String? label;
  @override
  Widget build(BuildContext context) {
    return FilterChip(
      color: MaterialStatePropertyAll(UIColors.neutral.shade300),
      label: Text(
        label ?? '',
        style: UITextStyle.subtitle2
            .copyWith(color: UIColors.primary, fontSize: 13),
      ),
      selected: isSelected,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(10),
      ),
      onSelected: (bool value) {},
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }
}
