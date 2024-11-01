import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:app_ui/app_ui.dart';

class AppImage extends StatelessWidget {
  final String? _imageUrl;
  final double? _width;
  final double? _height;

  const AppImage({
    required String? imageUrl,
    double? width,
    double? height,
    BoxFit? fit,
  })  : _imageUrl = imageUrl,
        _height = height,
        _width = width;

  @override
  Widget build(BuildContext context) {
    if (_imageUrl == null || _imageUrl!.toLowerCase().contains('null')) {
      return Assets.images.otpLogo.image(
        height: _height,
        width: _width,
        fit: BoxFit.cover,
      );
    }

    return CachedNetworkImage(
      imageUrl: _imageUrl!,
      height: _height,
      width: _width,
      fit: BoxFit.cover,

      // Error widget in case of a network error
      errorWidget: (context, url, error) {
        // Optional: Log the error or handle it in other ways
        debugPrint(
            '_________________________________-Image loading error: $error');
        return Assets.images.otpLogo.image(
          height: _height,
          width: _width,
          fit: BoxFit.cover,
        );
      },
      // Display a loading indicator while the image is loading
      progressIndicatorBuilder: (context, url, downloadProgress) {
        return CircularProgressIndicator.adaptive(
          value: downloadProgress.progress,
          valueColor: AlwaysStoppedAnimation<Color>(AppColors.accepted),
        ).centralize();
      },
    );
  }
}
