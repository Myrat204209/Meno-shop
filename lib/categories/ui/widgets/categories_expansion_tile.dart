// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:data_provider/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meno_shop/app/app.dart';
import 'package:meno_shop/constants/constants.dart';
import 'package:meno_shop/l10n/l10n.dart';

class CategoriesExpansionTile extends StatelessWidget {
  const CategoriesExpansionTile({
    super.key,
    required this.category,
  });
  final CategoryItem category;
  @override
  Widget build(BuildContext context) {
    final subcategories = category.subcategories;
    final locale = context.l10n.localeName;
    return ExpansionTile(
      collapsedShape:
          ShapeBorderX.continousRectangle(15, AppColors.neutral.shade50),
      shape: ShapeBorderX.continousRectangle(15, AppColors.neutral.shade50),
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      leading: const Icon(
        Icons.plumbing,
        color: AppColors.secondary,
      ),
      title: Text(
        category.name!.changeLocale(locale),
        style: const AppTextStyle.text()
            .semiBold()
            .withColor(const Color(0xFF221122)),
      ),
      children: subcategories!.map((subcategory) {
        return InkWell(
          onTap: () {
            context.pushNamed(RouteNames.products.name);
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: ListTile(
              leading: const Icon(
                Icons.abc,
                color: AppColors.transparent,
              ),
              visualDensity: VisualDensity.compact,
              dense: true,
              contentPadding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
              title: Text(subcategory.name!.changeLocale(locale),
                  style: const AppTextStyle.text()
                      .withColor(const Color(0xFF221122))),
              shape: ShapeBorderX.continousRectangle(
                  15, AppColors.neutral.shade50),
            ),
          ),
        );
      }).toList(),
    ).paddingSymmetric(vertical: 5, horizontal: 10);
  }
}
