import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:meno_shop/features/product_details/product_details.dart';

class ProductDetailsSizeSelector extends StatelessWidget {
  const ProductDetailsSizeSelector({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Select size',
          style: kAppTitleTextStyle,
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 10,
          children: sizes
              .map((element) => ProductSizeChip(
                    isSelected: element == 'M' ? true : false,
                    label: element,
                  ))
              .toList(),
        ),
      ],
    );
  }
}

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
