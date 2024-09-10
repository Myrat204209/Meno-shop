import 'dart:developer';

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:meno_shop/l10n/l10n.dart';
import 'package:meno_shop/product_details/product_details.dart';

class ProductDetailsSizeSelector extends HookWidget {
  const ProductDetailsSizeSelector({
    super.key,
    required this.uuid,
  });
  final String uuid;

  @override
  Widget build(BuildContext context) {
    // Manage selected size state using hooks
    final selectedSize = useState<String?>(null);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          context.l10n.selectSize,
          style: kAppTitleTextStyle,
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 55,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: sizes
                .map((element) => ProductSizeChip(
                      label: element,
                      isSelected: selectedSize.value == element,
                      onPressed: () {
                        log('Selected Size: $element');
                        selectedSize.value = element;
                      },
                    ).paddingOnly(right: 10))
                .toList(),
          ),
        ),
      ],
    );
  }
}

class ProductSizeChip extends StatelessWidget {
  const ProductSizeChip({
    super.key,
    required this.onPressed,
    required this.label,
    required this.isSelected,
  });

  final VoidCallback onPressed;
  final String? label;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      avatar: SizedBox(
        height: 50,
        width: 80,
        child: Text(
          label ?? '',
          style: const AppTextStyle.text()
              .medium()
              .lg()
              .semiBold()
              .withColor(changeColor(isSelected)),
        ).centralize(),
      ),
      showCheckmark: false,
      disabledColor: disabledColor,
      selectedColor: selectedColor,
      color: const WidgetStatePropertyAll(AppColors.quaterniary),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      labelPadding: const EdgeInsets.only(bottom: 17, right: 0, left: 0),
      label: const SizedBox(),
      selected: isSelected,
      side: BorderSide(color: changeColor(isSelected)),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      onSelected: (_) {
        onPressed(); // Trigger the onPressed callback
      },
    );
  }
}

const Color selectedColor = AppColors.secondary;
final Color disabledColor = AppColors.neutral.shade500;

Color changeColor(bool isSelected) =>
    isSelected ? selectedColor : disabledColor;
