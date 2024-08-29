import 'package:app_ui/app_ui.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:meno_shop/banner/banner.dart';
import 'package:meno_shop/l10n/l10n.dart';

class HomePageMerch extends StatelessWidget {
  const HomePageMerch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final defaultBannerStyle =
        const AppTextStyle.text().regular().withColor(AppColors.quaterniary);
    final l10n = context.l10n;
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 130,
        width: 360,
        child: Stack(
          alignment: Alignment.topCenter,
          fit: StackFit.expand,
          children: [
            Assets.images.merchBanner.image(fit: BoxFit.fill),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: AppSpacing.md),
                AutoSizeText(
                  l10n.merchLabel,
                  style: defaultBannerStyle,
                  overflow: TextOverflow.ellipsis,
                ),
                AutoSizeText(
                  l10n.merchTitle,
                  style: const AppTextStyle.text()
                      .bold()
                      .withColor(AppColors.quaterniary),
                  overflow: TextOverflow.ellipsis,
                ),
                AutoSizeText(
                  l10n.merchSubtitle,
                  style: defaultBannerStyle,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: AppSpacing.sm),
                BannerButton(
                  onPressed: () {}, // Ensure the callback is used here
                  bannerType: '',
                  text: l10n.loadMore,
                ).paddingSymmetric(vertical: 5),
              ],
            ).centralize(),
          ],
        ),
      ),
    );
  }
}
