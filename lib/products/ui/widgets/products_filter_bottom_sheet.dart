import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:meno_shop/favorites/favorites.dart';
import 'package:meno_shop/l10n/l10n.dart';


class FilterBottomSheetContent extends StatelessWidget {
  const FilterBottomSheetContent({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Column(
      children: [
        Text(
          l10n.filter,
          style: const AppTextStyle.text().headline6().semiBold(),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: AppSpacing.lg),
        const Wrap(
          children: [
            FilterPageChip(
              isSelected: true,
              label: ' Accessories',
            )
          ],
        ),
        const FilterPageWrap(
          children: categoryChipList,
          label: '',
        ),
        const FilterPageWrap(children: sizeChipList, label: 'Size'),
        const FilterPageWrap(children: brandChipList, label: 'Brands'),
        const Expanded(child: SizedBox.shrink()),
        AppButton.expanded(
          buttonText: context.l10n.close,
          onTap: () {},
        )
      ],
    );
  }
}
