// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

import 'package:meno_shop/banner/banner.dart';

/// A widget representing the button displayed on the AppBannerCard.
class BannerButton extends StatelessWidget {
  /// Creates a new instance of BannerButton.
  const BannerButton({
    super.key,
    this.text = 'Shop Now',
    required this.bannerType,
    required this.onPressed,
  });

  final String text;
  final BannerType bannerType;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: ShapeBorderX.roundedRectangle(10),
      color: AppColors.quaterniary,
      onPressed: onPressed,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const AppTextStyle.text().semiBold().md(),
      ).paddingSymmetric(vertical: 4, horizontal: 12),
    );
  }
}
