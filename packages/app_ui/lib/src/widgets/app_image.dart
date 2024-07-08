// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

enum ImageType {
  /// Asset
  asset,

  /// Cached network
  cached,
}

class AppImage extends StatelessWidget {
  final String _imageUrl;
  final double? _width;
  final double? _height;
  final ImageType _imageType;
  final BoxFit? _fit;
  const AppImage({
    required String imageUrl,
    required ImageType imageType,
    double? width,
    double? height,
    BoxFit? fit,
  })  : _imageUrl = imageUrl,
        _height = height,
        _width = width,
        _fit = fit,
        _imageType = imageType;

  @override
  Widget build(BuildContext context) {
    return switch (_imageType) {
      ImageType.asset => Image.asset(
          _imageUrl,
          width: _width ?? double.infinity,
          height: _height,
          fit: _fit ?? BoxFit.cover,
        ),
      ImageType.cached => CachedNetworkImage(
          imageUrl: _imageUrl,
          fit: BoxFit.cover,
          errorWidget: (context, url, error) => Image.asset(
            Assets.images.placeholder.extendPath(),
            fit: _fit ?? BoxFit.fitHeight,
          ),
          height: _height,
          width: _width,
          placeholder: (_, url) =>
              CircularProgressIndicator.adaptive().centralize(),
        )
    };
  }
}
