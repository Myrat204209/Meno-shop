import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:meno_shop/banner/banner.dart';

class HomePageCenterBanner extends StatelessWidget {
  const HomePageCenterBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BannerCard(
        imageUrl: Assets.images.centerBanner.extendPath(),
        onPressed: () {},
        bannerType: BannerType.merch,
        label: 'For Traders',
        title: 'Special Offers',
        subtitle: 'All products, whole space price',
        buttonText: 'Load more',
      ),
    );
  }
}
