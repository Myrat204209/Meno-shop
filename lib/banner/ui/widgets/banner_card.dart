import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:meno_shop/banner/banner.dart';

enum BannerType {
  ad,
  poster,
  local,
}

/// A widget representing a banner card that displays an image, label, title, subtitle, and a button.
class BannerCard extends StatelessWidget {
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
  final String bannerType;
  final String? label;
  final String? title;
  final String? subtitle;
  final String? buttonText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      child: AspectRatio(
        aspectRatio: 2 / 1,
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: [
            BannerImage(
              bannerImage: imageUrl,
              fit: BoxFit.cover,
            ),
            BannerContent(
              bannerType: bannerType,
              buttonText: buttonText ?? '',
              label: label ?? '',
              title: title ?? '',
              subtitle: subtitle ?? '',
              onPressed: onPressed, // Pass the callback to BannerContent
            ),
          ],
        ),
      ).paddingSymmetric(horizontal: 5, vertical: 5),
    );
  }
}
