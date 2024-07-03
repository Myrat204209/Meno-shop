/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vector_graphics/vector_graphics.dart';

class $AssetsAdvantagesGen {
  const $AssetsAdvantagesGen();

  /// File path: assets/advantages/amatly_1.svg
  SvgGenImage get amatly1 =>
      const SvgGenImage('assets/advantages/amatly_1.svg');

  /// File path: assets/advantages/amatly_2.svg
  SvgGenImage get amatly2 =>
      const SvgGenImage('assets/advantages/amatly_2.svg');

  /// File path: assets/advantages/amatly_3.svg
  SvgGenImage get amatly3 =>
      const SvgGenImage('assets/advantages/amatly_3.svg');

  /// File path: assets/advantages/fast_delivery.svg
  SvgGenImage get fastDelivery =>
      const SvgGenImage('assets/advantages/fast_delivery.svg');

  /// File path: assets/advantages/online payment.svg
  SvgGenImage get onlinePayment =>
      const SvgGenImage('assets/advantages/online payment.svg');

  /// File path: assets/advantages/present_plus_1.svg
  SvgGenImage get presentPlus1 =>
      const SvgGenImage('assets/advantages/present_plus_1.svg');

  /// List of all assets
  List<SvgGenImage> get values =>
      [amatly1, amatly2, amatly3, fastDelivery, onlinePayment, presentPlus1];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/center-banner.jpg
  AssetGenImage get centerBanner =>
      const AssetGenImage('assets/images/center-banner.jpg');

  /// File path: assets/images/jeans.jpg
  AssetGenImage get jeans => const AssetGenImage('assets/images/jeans.jpg');

  /// File path: assets/images/placeholder.jpg
  AssetGenImage get placeholder =>
      const AssetGenImage('assets/images/placeholder.jpg');

  /// List of all assets
  List<AssetGenImage> get values => [centerBanner, jeans, placeholder];
}

class $AssetsLanguageGen {
  const $AssetsLanguageGen();

  /// File path: assets/language/english.svg
  SvgGenImage get english => const SvgGenImage('assets/language/english.svg');

  /// File path: assets/language/russia.svg
  SvgGenImage get russia => const SvgGenImage('assets/language/russia.svg');

  /// File path: assets/language/turkmen.svg
  SvgGenImage get turkmen => const SvgGenImage('assets/language/turkmen.svg');

  /// List of all assets
  List<SvgGenImage> get values => [english, russia, turkmen];
}

class Assets {
  Assets._();

  static const String package = 'app_ui';

  static const $AssetsAdvantagesGen advantages = $AssetsAdvantagesGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsLanguageGen language = $AssetsLanguageGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size = null});

  final String _assetName;

  static const String package = 'app_ui';

  final Size? size;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    @Deprecated('Do not specify package for a generated library asset')
    String? package = package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    @Deprecated('Do not specify package for a generated library asset')
    String? package = package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => 'packages/app_ui/$_assetName';
}

class SvgGenImage {
  const SvgGenImage(
    this._assetName, {
    this.size = null,
  }) : _isVecFormat = false;

  const SvgGenImage.vec(
    this._assetName, {
    this.size = null,
  }) : _isVecFormat = true;

  final String _assetName;

  static const String package = 'app_ui';

  final Size? size;
  final bool _isVecFormat;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    @Deprecated('Do not specify package for a generated library asset')
    String? package = package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme? theme,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture(
      _isVecFormat
          ? AssetBytesLoader(_assetName,
              assetBundle: bundle, packageName: package)
          : SvgAssetLoader(_assetName,
              assetBundle: bundle, packageName: package),
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => 'packages/app_ui/$_assetName';
}
