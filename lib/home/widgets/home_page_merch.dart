import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meno_shop/banner/banner.dart';
import 'package:meno_shop/l10n/l10n.dart';

class HomePageMerch extends StatelessWidget {
  const HomePageMerch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 115.h,
        width: 360.w,
        child: AspectRatio(
          aspectRatio: 18 / 5,
          child: Stack(
            alignment: Alignment.topCenter,
            fit: StackFit.expand,
            children: [
              AppImage(
                imageUrl: Assets.images.centerBanner.extendPath(),
                height: double.infinity,
              ),
              FittedBox(
                child: BannerContent(
                  bannerType: BannerType.merch,
                  buttonText: l10n.loadMore,
                  label: l10n.merchLabel,
                  title: l10n.merchTitle,
                  subtitle: l10n.merchSubtitle,
                ).paddingOnly(top: 10),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
/**

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
      aspectRatio: 328 / 165,
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

final defaultBannerStyle =
    const AppTextStyle.text().regular().md().withColor(AppColors.quaterniary);

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
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
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
        const Gap(AppSpacing.lg),
        if (bannerType != BannerType.poster)
          BannerButton(
            onPressed: () {},
            bannerType: bannerType,
          )
      ],
    );
  }
}

 */