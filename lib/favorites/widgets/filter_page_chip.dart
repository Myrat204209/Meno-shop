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
      color: WidgetStatePropertyAll(AppColors.neutral.shade300),
      label: Text(label ?? '', style: const AppTextStyle.text().regular()),
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
