// ignore_for_file: public_member_api_docs, sort_constructors_first
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
  /// Creates a new instance of AppBannerCard.
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
  final BannerType bannerType;
  final String? label;
  final String? title;
  final String? subtitle;
  final String? buttonText;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2 / 1,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.3),
                BlendMode.multiply,
              ),
              //TODO: Change to the network
              child: AppImage(
                imageUrl: imageUrl,
                imageType: ImageType.asset,
                height: double.infinity,
              ),
            ),
          ),
          Positioned(
            left: 20,
            top: 35,
            child: BannerContent(
              bannerType: bannerType,
              buttonText: buttonText,
              label: label ?? 'From Online Stores',
              title: title ?? 'Men\'s Lifestyle Collection',
              subtitle: subtitle ?? 'Subtitle',
            ),
          ),
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
    this.buttonText,
  });
  final BannerType bannerType;
  final String label;
  final String? buttonText;
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    final defaultBannerStyle =
        const AppTextStyle.text().regular().withColor(AppColors.quaterniary);
    return SizedBox(
      height: 124,
      width: 340,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: bannerType != BannerType.merch
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.center,
        children: [
          AutoSizeText(
            label,
            style: defaultBannerStyle,
          ).paddingOnly(bottom: 5),
          AutoSizeText(
            title,
            style: const AppTextStyle.text()
                .bold()
                .md()
                .withColor(AppColors.quaterniary),
          ).paddingOnly(bottom: 5),
          AutoSizeText(
            subtitle,
            style: defaultBannerStyle,
          ).paddingOnly(bottom: 10),
          if (bannerType != BannerType.poster)
            BannerButton(
              onPressed: () {},
              bannerType: bannerType,
              text: buttonText ?? '',
            )
        ],
      ),
    );
  }
}
