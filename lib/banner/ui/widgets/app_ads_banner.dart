import 'package:app_ui/app_ui.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:data_provider/data_provider.dart';
import 'package:flutter/material.dart';

/// Carousel Banner for banner ads
class AppAdsBanner extends StatelessWidget {
  /// Constructor
  const AppAdsBanner({
    required this.banners,
    super.key,
  });

  final Iterable<BannerItem> banners;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.md),
      child: CarouselSlider(
        options: CarouselOptions(
          viewportFraction: 1,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 5),
          autoPlayCurve: Curves.fastOutSlowIn,
        ),
        items: banners.map((banner) {
          return Builder(
            builder: (BuildContext context) {
              return AppBannerCard(
                label: banner.label,
                subtitle: banner.subtitle,
                title: banner.title,
                onButtonPressed: () {},
                imageLink: 's',
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
