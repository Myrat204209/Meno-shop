import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:meno_shop/favorites/favorites.dart';
import 'package:meno_shop/l10n/l10n.dart';

Future<void> showCategorieslterBottomSheet({
  required BuildContext context,
}) async =>
    showModalBottomSheet(
      context: context,
      useSafeArea: true,
      isScrollControlled: true,
      builder: (_) => const CategoriesFilterBottomSheet(),
    );

class CategoriesFilterBottomSheet extends StatelessWidget {
  const CategoriesFilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.lg,
      ).copyWith(
        bottom: MediaQuery.of(context).viewInsets.bottom + AppSpacing.xxlg,
      ),
      child: ListView(
        shrinkWrap: true,
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
                label: 'Categories Accessories',
              )
            ],
          ),
          const FilterPageWrap(
            children: categoryChipList,
            label: 'Categories',
          ),
          const FilterPageWrap(children: sizeChipList, label: 'Size'),
          const FilterPageWrap(children: brandChipList, label: 'Brands'),
          const Expanded(child: SizedBox()),
          AppButton.expanded(
            buttonText: 'Close',
            onTap: () {},
          )
        ],
      ),
    );
  }
}
