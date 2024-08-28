// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

/// A widget representing the button displayed on the AppBannerCard.
class BannerButton extends StatelessWidget {
  /// Creates a new instance of BannerButton.
  const BannerButton({
    super.key,
    required this.text,
    required this.bannerType,
    required this.onPressed,
  });

  final String text;
  final String bannerType;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: ShapeBorderX.roundedRectangle(12),
      height: 22,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      color: AppColors.quaterniary,
      onPressed: onPressed,
      child: AutoSizeText(
        text,
        minFontSize: 10,
        maxFontSize: 14,
        textAlign: TextAlign.center,
        style: const AppTextStyle.text().semiBold(),
      ).paddingSymmetric(vertical: 4, horizontal: 5),
    );
  }
}
