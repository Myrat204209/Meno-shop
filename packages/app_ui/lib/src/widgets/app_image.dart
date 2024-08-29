import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:app_ui/app_ui.dart'; // Assuming this is where Assets and AppColors are defined.

class AppImage extends StatelessWidget {
  final String? _imageUrl;
  final double? _width;
  final double? _height;
  final BoxFit? _fit;

  const AppImage({
    required String? imageUrl,
    double? width,
    double? height,
    BoxFit? fit,
  })  : _imageUrl = imageUrl,
        _height = height,
        _width = width,
        _fit = fit;

  @override
  Widget build(BuildContext context) {
    // Check if the imageUrl is empty or invalid
    if (_imageUrl == null || _imageUrl!.contains('null')) {
      return Assets.images.otpLogo.image(
        height: _height,
        width: _width,
        fit: BoxFit.contain,
      );
    }

    return CachedNetworkImage(
      imageUrl: _imageUrl!,
      height: _height,
      width: _width,
      fit: _fit ?? BoxFit.contain,

      // Error widget in case of a network error
      errorWidget: (context, url, error) {
        // Optional: Log the error or handle it in other ways
        debugPrint(
            '_________________________________-Image loading error: $error');
        return Assets.images.otpLogo.image(
          height: _height,
          width: _width,
          fit: _fit ?? BoxFit.contain,
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
