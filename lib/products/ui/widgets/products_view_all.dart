// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:meno_shop/l10n/l10n.dart';

class ProductsViewAll extends StatelessWidget {
  const ProductsViewAll({
    super.key,
    required this.onViewAllTap,
    required this.title,
    this.padding,
  });

  final VoidCallback? onViewAllTap;
  final String title;
  final double? padding;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const AppTextStyle.text().lg().bold(),
        ),
        TextButton(
          onPressed: onViewAllTap,
          child: Text(
            context.l10n.viewAll,
            style: const AppTextStyle.text()
                .regular()
                .sm()
                .withColor(AppColors.secondary),
          ),
        ),
      ],
    ).paddingSymmetric(horizontal: padding ?? 15);
  }
}

class ProductDetailsPrices extends StatelessWidget {
  const ProductDetailsPrices({
    super.key,
    required this.price,
    this.originalPrice,
  });
  final double price;
  final double? originalPrice;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          flex: 2,
          child: Text(
            '$price TMT',
            style: const AppTextStyle.text().lg().bold(),
          ),
        ),
        if (originalPrice != null)
          Expanded(
            child: Text(
              '${originalPrice?.toInt()} TMT',
              style: const AppTextStyle.text()
                  .regular()
                  .sm()
                  .copyWith(decoration: TextDecoration.lineThrough),
            ),
          )
      ],
    );
  }
}
