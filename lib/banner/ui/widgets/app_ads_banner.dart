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
          // enlargeCenterPage: true,
          // enlargeFactor: 0.3,
        ),
        items: banners.map((banner) {
          return Builder(
            builder: (BuildContext context) {
              return AppBannerCard(
                label: banner.label,
                subtitle: banner.subtitle,
                title: banner.title,
                onButtonPressed: () {},
                imageLink: '',
              );
            },
          );
        }).toList(),
      ),
    );
  }
}

// /// {@template banner_ad}
// /// A reusable banner ad block widget.
// /// {@endtemplate}
// class BannerAd extends StatelessWidget {
//   /// {@macro banner_ad}
//   const BannerAd({
//     required this.imageUrl,
//     this.borderRadius,
//     super.key,
//   });

//   /// The associated banner image url.
//   final String imageUrl;

//   /// Border radius
//   final BorderRadius? borderRadius;

//   @override
//   Widget build(BuildContext context) {
//     return ClipRRect(
//       clipBehavior: Clip.hardEdge,
//       borderRadius: borderRadius ?? BorderRadius.zero,
//       child: AppCachedNetworkImage(imageLink: imageUrl),
//     );
//   }
// }
