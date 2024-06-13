// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

enum BannerType {
  ad(0),
  poster(10),
  local(10);

  final double radius;
  const BannerType(this.radius);
}

/// A widget representing a banner card that displays an image, label, title, subtitle, and a button.
class AppBannerCard extends StatelessWidget {
  /// Creates a new instance of AppBannerCard.
  const AppBannerCard({
    super.key,
    required this.imageUrl,
    required this.onPressed,
    required this.bannerType,
    this.label,
    this.title,
    this.subtitle,
  });

  final String imageUrl;
  final VoidCallback onPressed;
  final BannerType bannerType;
  final String? label;
  final String? title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: bannerType.radius, vertical: 10),
      child: Stack(
        alignment: bannerType == BannerType.poster
            ? Alignment.centerLeft
            : Alignment.topCenter,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(bannerType.radius),
            child: switch (bannerType) {
              BannerType.poster => AppCachedNetworkImage(
                  imageLink: imageUrl,
                  width: double.maxFinite,
                ),
              _ => AppImageAsset(
                  imageUrl: imageUrl,
                  height: 150,
                ),
            },
          ),
          Positioned(
            child: switch (bannerType) {
              BannerType.poster => BannerContent(
                  label: label ?? 'label',
                  title: title ?? 'title',
                  subtitle: subtitle ?? 'subtitle',
                ),
              BannerType.ad => Center(
                  child: BannerContent(
                    label: label ?? 'label',
                    title: title ?? 'title',
                    subtitle: subtitle ?? 'subtitle',
                  ),
                ),
              _ => const SizedBox(),
            },
          ),
          Positioned(
            bottom: 10,
            child: AppBannerButton(
              onPressed: onPressed,
            ),
          )
        ],
      ),
    );
  }
}

class AppImageAsset extends StatelessWidget {
  const AppImageAsset({
    super.key,
    required this.imageUrl,
    required this.height,
  });
  final String imageUrl;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imageUrl,
      height: height,
      fit: BoxFit.cover,
      width: double.infinity,
    );
  }
}

/// A widget representing the button displayed on the AppBannerCard.
class AppBannerButton extends StatelessWidget {
  /// Creates a new instance of AppBannerButton.
  const AppBannerButton({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: AppColors.quaterniary,
      onPressed: onPressed,
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Text(
          'Shop now',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

final defaultBannerStyle =
    const AppTextStyle.text().regular().withColor(AppColors.primary);

class BannerContent extends StatelessWidget {
  const BannerContent({
    super.key,
    required this.label,
    required this.title,
    required this.subtitle,
  });
  final String label;
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Gap(AppSpacing.sm),

        /// Label of banner
        Text(
          label,
          style: defaultBannerStyle,
        ),
        const Gap(AppSpacing.xxs),

        /// Title of banner
        Text(
          title,
          style: const AppTextStyle.display()
              .headline6()
              .bold()
              .withColor(AppColors.primary),
        ),
        const Gap(AppSpacing.xxs),

        /// Subtitle of banner
        Text(
          subtitle,
          style: defaultBannerStyle,
        ),
        const Gap(AppSpacing.xxxlg),
      ],
    );
  }
}
