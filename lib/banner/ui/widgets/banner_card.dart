import 'package:app_ui/app_ui.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meno_shop/banner/banner.dart';

enum BannerType {
  ad,
  poster,
  local,
  merch,
}

/// A widget representing a banner card that displays an image, label, title, subtitle, and a button.
class BannerCard extends StatelessWidget {
  const BannerCard({
    super.key,
    required this.imageUrl,
    required this.onPressed,
    required this.bannerType,
    this.label,
    this.title,
    this.subtitle,
    this.buttonText,
  });

  final String imageUrl;
  final String bannerType;
  final String? label;
  final String? title;
  final String? subtitle;
  final String? buttonText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    // Ensure the bannerType is valid
    assert(BannerType.values.map((e) => e.name).contains(bannerType),
        'Invalid bannerType: $bannerType');

    return AspectRatio(
      aspectRatio: 2 / 1,
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: AppImage(
              imageUrl: imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.maxFinite,
            ).paddingAll(5),
          ),
          FittedBox(
            child: BannerContent(
              bannerType: bannerType,
              buttonText: buttonText ?? '',
              label: label ?? '',
              title: title ?? '',
              subtitle: subtitle ?? '',
              onPressed: onPressed, // Pass the callback to BannerContent
            ),
          ).paddingOnly(left: 25),
        ],
      ),
    ).paddingSymmetric(horizontal: 10, vertical: 5);
  }
}

class BannerContent extends StatelessWidget {
  const BannerContent({
    super.key,
    required this.bannerType,
    required this.label,
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.onPressed, // Added onPressed to handle button action
  });

  final String bannerType;
  final String label;
  final String buttonText;
  final String title;
  final String subtitle;
  final VoidCallback onPressed; // Button callback

  @override
  Widget build(BuildContext context) {
    final defaultBannerStyle =
        const AppTextStyle.text().regular().withColor(AppColors.quaterniary);

    return SizedBox(
      height: 124.h,
      width: 340.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: bannerType != BannerType.merch.name
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: AutoSizeText(
              label,
              style: defaultBannerStyle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Expanded(
            flex: 1,
            child: AutoSizeText(
              title,
              style: const AppTextStyle.text()
                  .bold()
                  .md()
                  .withColor(AppColors.quaterniary),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Expanded(
            flex: 1,
            child: AutoSizeText(
              subtitle,
              style: defaultBannerStyle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          if (bannerType != BannerType.poster.name)
            Expanded(
              flex: 2,
              child: BannerButton(
                onPressed: onPressed, // Ensure the callback is used here
                bannerType: bannerType,
                text: buttonText,
              ).paddingSymmetric(vertical: 10),
            ),
        ],
      ),
    );
  }
}
