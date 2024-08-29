import 'package:app_ui/app_ui.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/widgets.dart';
import 'package:meno_shop/banner/banner.dart';

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
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: 104,
      child: AspectRatio(
        aspectRatio: 360 / 104,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: AppSpacing.md),
            AutoSizeText(
              label,
              style: defaultBannerStyle,
              overflow: TextOverflow.ellipsis,
            ),
            AutoSizeText(
              title,
              style: const AppTextStyle.text()
                  .bold()
                  .withColor(AppColors.quaterniary),
              overflow: TextOverflow.ellipsis,
            ),
            AutoSizeText(
              subtitle,
              style: defaultBannerStyle,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: AppSpacing.md),
            if (bannerType != BannerType.poster.name)
              BannerButton(
                onPressed: onPressed, // Ensure the callback is used here
                bannerType: bannerType,
                text: buttonText,
              ).paddingSymmetric(vertical: 10),
            const SizedBox(height: AppSpacing.xlg)
          ],
        ),
      ).paddingOnly(left: 25),
    );
  }
}
