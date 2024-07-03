// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

enum BannerType {
  ad(15),
  poster(15),
  local(15),
  merch(0);

  final double radius;
  const BannerType(this.radius);
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
  final VoidCallback onPressed;
  final BannerType bannerType;
  final String? label;
  final String? title;
  final String? subtitle;
  final String? buttonText;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context).width;
    return AspectRatio(
      aspectRatio: bannerType == BannerType.merch ? 45 / 15 : 2 / 1,
      child: Card(
        margin: EdgeInsets.zero,
        shape: ShapeBorderX.roundedRectangle(bannerType.radius),
        child: Stack(
          // fit: StackFit.expand,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(bannerType.radius),
              child: AppImage(
                imageUrl: imageUrl,
                imageType: ImageType.asset,
                height: double.infinity,
              ),
            ),
            Positioned(
              left: bannerType == BannerType.merch ? size / 4 : size / 15,
              top: 10 + 2 * bannerType.radius,
              child: BannerContent(
                isCenter: bannerType == BannerType.merch,
                label: label ?? 'Label',
                title: title ?? 'Title',
                subtitle: subtitle ?? 'Subtitle',
              ),
            ),
            Positioned(
                left: bannerType == BannerType.merch ? size / 2.6 : size / 15,
                bottom: 15 + 3 * bannerType.radius,
                child: BannerButton(
                  onPressed: () {},
                  text: buttonText ?? '',
                ))
          ],
        ),
      ),
    ).paddingSymmetric(
      horizontal: bannerType.radius,
      vertical: bannerType.radius / 2,
    );
  }
}

/// A widget representing the button displayed on the AppBannerCard.
class BannerButton extends StatelessWidget {
  /// Creates a new instance of BannerButton.
  const BannerButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: ShapeBorderX.roundedRectangle(10),
      color: AppColors.quaterniary,
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        child: Text(
          text,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

final defaultBannerStyle =
    const AppTextStyle.text().subtitle1().withColor(AppColors.quaterniary);

class BannerContent extends StatelessWidget {
  const BannerContent({
    super.key,
    required this.label,
    required this.title,
    required this.subtitle,
    this.isCenter = false,
  });
  final bool isCenter;
  final String label;
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment:
          isCenter ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: defaultBannerStyle,
        ),
        const Gap(AppSpacing.xxs),
        Text(
          title,
          style: const AppTextStyle.display()
              .headline6()
              .bold()
              .withColor(AppColors.quaterniary),
        ),
        const Gap(AppSpacing.xxs),
        Text(
          subtitle,
          style: defaultBannerStyle,
        ),
        const Gap(AppSpacing.xxxlg),
      ],
    );
  }
}

            // child: switch (bannerType) {
            //   BannerType.poster => AppCachedNetworkImage(
            //       imageLink: imageUrl,
            //       width: double.maxFinite,
            //     ),
            //   _ => AppImageAsset(
            //       imageUrl: imageUrl,
            //       height: 150,
            //     ),
            // },


            /**
             *           Positioned(
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
            child: BannerButton(
              onPressed: onPressed,
            ),
          )
             */