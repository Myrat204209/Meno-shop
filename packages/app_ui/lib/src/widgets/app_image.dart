// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AppImage extends StatelessWidget {
  final String _imageUrl;
  final double? _width;
  final double? _height;
  final BoxFit? _fit;
  const AppImage({
    required String imageUrl,
    double? width,
    double? height,
    BoxFit? fit,
  })  : _imageUrl = imageUrl,
        _height = height,
        _width = width,
        _fit = fit;

  @override
  Widget build(BuildContext context) {
    ///TODO : Change this URL according to your backend API
    return CachedNetworkImage(
      imageUrl: 'http://192.168.30.235:3000/$_imageUrl',
      fit: BoxFit.cover,
      errorWidget: (context, url, error) => Image.asset(
        Assets.images.otpLogo.extendPath(),
        fit: _fit ?? BoxFit.contain,
      ),
      progressIndicatorBuilder: (_, url, downloadProgress) =>
          CircularProgressIndicator.adaptive(
        value: downloadProgress.progress,
        valueColor: AlwaysStoppedAnimation<Color>(AppColors.accepted),
      ).centralize(),
      height: _height,
      width: _width,
    );
  }
}
