// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:data_provider/data_provider.dart';
import 'package:flutter/material.dart';

class CategoriesExpansionTile extends StatelessWidget {
  const CategoriesExpansionTile({
    super.key,
    required this.category,
  });
  final CategoryItem category;
  @override
  Widget build(BuildContext context) {
    final subcategories = category.subcategories;
    return ExpansionTile(
      collapsedShape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(color: AppColors.neutral.shade50)),
      shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(color: AppColors.neutral.shade50)),
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      leading: const Icon(
        Icons.plumbing,
        color: AppColors.secondary,
      ),
      title: Text(
        category.name ?? '',
        style: const AppTextStyle.text()
            .regular()
            .md()
            .withColor(const Color(0xFF221122)),
      ),
      children: subcategories!.map((subcategory) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: ListTile(
            leading: const Icon(
              Icons.abc,
              color: AppColors.transparent,
            ),
            title: Text(subcategory.name ?? ''),
            shape: ContinuousRectangleBorder(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              side: BorderSide(width: 0.5, color: AppColors.neutral.shade50),
            ),
          ),
        );
      }).toList(),
    ).paddingSymmetric(vertical: 5, horizontal: 10);
  }
}
