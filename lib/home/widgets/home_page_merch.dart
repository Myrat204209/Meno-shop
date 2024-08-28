import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
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
        height: 115,
        width: 360,
        child: AspectRatio(
          aspectRatio: 18 / 5,
          child: Stack(
            alignment: Alignment.topCenter,
            fit: StackFit.expand,
            children: [
              Assets.images.merchBanner.image(fit: BoxFit.fill),
              FittedBox(
                child: BannerContent(
                  bannerType: BannerType.local.name,
                  buttonText: l10n.loadMore,
                  label: l10n.merchLabel,
                  title: l10n.merchTitle,
                  subtitle: l10n.merchSubtitle,
                  onPressed: () {},
                ).paddingOnly(top: 10).centralize(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
