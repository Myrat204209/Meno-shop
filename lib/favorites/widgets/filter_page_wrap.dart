import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:meno_shop/favorites/favorites.dart' show FilterPageChip;

class FilterPageWrap extends StatelessWidget {
  const FilterPageWrap({
    super.key,
    this.children,
    required this.label,
  });
  final List<String?>? children;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const AppTextStyle.text().lg().medium(),
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  'Select All',
                  style: const AppTextStyle.text()
                      .regular()
                      .sm()
                      .withColor(AppColors.secondary2),
                )),
          ],
        ).paddingSymmetric(horizontal: 2, vertical: 15),
        Wrap(
          spacing: 10,
          runSpacing: 12,
          children: children == null
              ? []
              : children!
                  .map((element) => FilterPageChip(
                        isSelected: false,
                        label: element,
                      ))
                  .toList(),
        ).paddingOnly(right: 11),
        Divider(
          color: AppColors.neutral.shade300,
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
