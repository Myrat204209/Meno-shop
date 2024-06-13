import 'package:flutter/material.dart';
import 'package:meno_shop/banner/banner.dart';

class HomePageCenterBanner extends StatelessWidget {
  const HomePageCenterBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: AppBannerCard(
        imageUrl: 'assets/center-banner.jpg',
        onPressed: () {},
        bannerType: BannerType.ad,
        label: 'For Traders',
        title: 'Special Offers',
        subtitle: 'All products, whole space price',
      ),
      // Stack(
      //   children: [

      //     Image.asset(
      //       'assets/center-banner.jpg',
      //       height: 150,
      //       fit: BoxFit.fill,
      //     ),
      //     const Center(
      //       child: BannerContent(
      //         label: 'For Traders',
      //         title: 'Special Offers',
      //         subtitle: 'All products, whole space price',
      //       ),
      //     )
      //   ],
      // ),
    );
  }
}
