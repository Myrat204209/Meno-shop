// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AppProductItem extends StatelessWidget {
  const AppProductItem({
    super.key,
    this.onTap,
    this.image,
    required this.price,
    required this.label,
    required this.category,
  });
  final VoidCallback? onTap;
  final String? image;
  final double price;
  final String label;
  final String category;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: UIColors.quaterniary,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Column(
          children: [
            Expanded(child: AppProductImage(image: image)),
            Gap(10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppProductContentText(
                  category: category,
                  label: label,
                  price: price,
                ),
                AppButton(
                  type: AppButtonType.small,
                  text: null,
                  onTap: () {
                    //TODO: Go to the Orders Page
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AppProductContentText extends StatelessWidget {
  const AppProductContentText({
    super.key,
    required this.category,
    required this.label,
    required this.price,
  });

  final String category;
  final String label;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          category,
          style: UITextStyle.subtitle2.copyWith(
            color: UIColors.neutral.shade700,
            fontSize: 11,
          ),
        ),
        Gap(10),
        Text(
          label,
          style: UITextStyle.headline5.copyWith(
            color: UIColors.primary,
            fontSize: 13,
            fontWeight: AppFontWeight.semiBold,
          ),
        ),
        Gap(10),
        Text(
          '${price.toInt()} TMT',
          style: UITextStyle.headline6.copyWith(
            color: UIColors.primary,
            fontWeight: AppFontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class AppProductImage extends StatelessWidget {
  const AppProductImage({
    super.key,
    required this.image,
  });

  final String? image;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: AppBorderColorBox(
        borderColor: UIColors.neutral.shade300,
        child: Image.asset(
          image!,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
