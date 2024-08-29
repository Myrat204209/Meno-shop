// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:flutter/widgets.dart';

class BannerImage extends StatelessWidget {
  const BannerImage({
    super.key,
    required this.bannerImage,
    this.imageUrl,
    this.width,
    this.height,
    this.fit,
  });

  final String bannerImage;
  final String? imageUrl;
  final double? width;
  final double? height;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: AppImage(
        imageUrl: bannerImage,
        fit: fit,
        height: height,
        width: width,
      ),
    );
  }
}
