// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

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
      aspectRatio: 19 / 9,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.3),
                BlendMode.multiply,
              ),
              child: AppImage(
                imageUrl: imageUrl,
                //TODO: Change to the network
                imageType: ImageType.asset,
                height: double.infinity,
              ),
            ),
          ),
          Positioned(
            left: 25,
            top: 60,
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
    ).paddingSymmetric(horizontal: 16, vertical: 10);
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
    final defaultBannerStyle = const AppTextStyle.text()
        .regular()
        .md()
        .withColor(AppColors.quaterniary);
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: bannerType != BannerType.merch
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.center,
      children: [
        Text(
          label,
          style: defaultBannerStyle,
        ),
        const Gap(AppSpacing.xxs),
        Text(
          title,
          style: const AppTextStyle.text()
              .bold()
              .lg()
              .withColor(AppColors.quaterniary),
        ),
        const Gap(AppSpacing.xxs),
        Text(
          subtitle,
          style: defaultBannerStyle,
        ),
        const Gap(AppSpacing.md),
        if (bannerType != BannerType.poster)
          BannerButton(
            onPressed: () {},
            bannerType: bannerType,
            text: buttonText ?? '',
          )
      ],
    );
  }
}
