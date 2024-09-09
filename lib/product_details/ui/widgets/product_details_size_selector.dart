// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:meno_shop/l10n/l10n.dart';
import 'package:meno_shop/product_details/product_details.dart';

class ProductDetailsSizeSelector extends StatelessWidget {
  const ProductDetailsSizeSelector({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
          // fit: BoxFit.contain,
          height: 55,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: sizes
                .map((element) => ProductSizeChip(
                      label: element,
                      onPressed: () {
                        log('----------$element      shu Size Saylandy----------------------');
                      },
                    ).paddingOnly(right: 10))
                .toList(),
          ),
        ),
      ],
    );
  }
}

const Color selectedColor = AppColors.secondary;
final Color disabledColor = AppColors.neutral.shade500;

Color changeColor(bool isSelected) =>
    isSelected ? selectedColor : disabledColor;

class ProductSizeChip extends HookWidget {
  const ProductSizeChip({
    super.key,
    required this.onPressed,
    required this.label,
  });
  final VoidCallback onPressed;
  final String? label;
  @override
  Widget build(BuildContext context) {
    final isSelected = useState(false);
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
              .withColor(changeColor(isSelected.value)),
        ).centralize(),
      ),
      showCheckmark: false,
      disabledColor: disabledColor,
      selectedColor: selectedColor,
      color: const WidgetStatePropertyAll(AppColors.quaterniary),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      labelPadding: const EdgeInsets.only(bottom: 17, right: 0, left: 0),
      label: const SizedBox(),
      selected: isSelected.value,
      side: BorderSide(color: changeColor(isSelected.value)),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      onSelected: (bool value) {
        isSelected.value = !isSelected.value;
      },
    );
  }
}
