import 'package:app_ui/app_ui.dart';
import 'package:flutter/widgets.dart';

class BannerImage extends StatelessWidget {
  const BannerImage({
    super.key,
    required this.bannerImage,
  });

  final String bannerImage;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: AppImage(
        imageUrl: bannerImage,
        fit: BoxFit.cover,
      ),
    );
  }
}
