import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

const Color selectedColor = AppColors.secondary;
final Color disabledColor = AppColors.neutral.shade500;

Color changeColor(bool isSelected) =>
    isSelected ? selectedColor : disabledColor;

class ProductSizeChip extends StatelessWidget {
  const ProductSizeChip({
    super.key,
    required this.isSelected,
    required this.label,
  });
  final bool isSelected;
  final String? label;
  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      showCheckmark: false,
      disabledColor: disabledColor,
      selectedColor: selectedColor,
      color: const WidgetStatePropertyAll(AppColors.quaterniary),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      labelPadding: const EdgeInsets.symmetric(horizontal: -5),
      label: SizedBox(
        height: 30,
        width: 40,
        child: Text(
          label ?? '',
          style: const AppTextStyle.text()
              .medium()
              .lg()
              .withColor(changeColor(isSelected)),
        ).centralize(),
      ),
      selected: isSelected,
      side: BorderSide(color: changeColor(isSelected)),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      onSelected: (bool value) {},
    );
  }
}
