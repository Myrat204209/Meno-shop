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

class $AssetsAdvantagesRuGen {
  const $AssetsAdvantagesRuGen();

  /// File path: assets/advantages_ru/fast_delivery.svg
  SvgGenImage get fastDelivery =>
      const SvgGenImage('assets/advantages_ru/fast_delivery.svg');

  /// File path: assets/advantages_ru/free_delivery.svg
  SvgGenImage get freeDelivery =>
      const SvgGenImage('assets/advantages_ru/free_delivery.svg');

  /// File path: assets/advantages_ru/one_t_one_g.svg
  SvgGenImage get oneTOneG =>
      const SvgGenImage('assets/advantages_ru/one_t_one_g.svg');

  /// File path: assets/advantages_ru/online_pay.svg
  SvgGenImage get onlinePay =>
      const SvgGenImage('assets/advantages_ru/online_pay.svg');

  /// File path: assets/advantages_ru/star_1.svg
  SvgGenImage get star1 => const SvgGenImage('assets/advantages_ru/star_1.svg');

  /// File path: assets/advantages_ru/star_2.svg
  SvgGenImage get star2 => const SvgGenImage('assets/advantages_ru/star_2.svg');

  /// File path: assets/advantages_ru/star_3.svg
  SvgGenImage get star3 => const SvgGenImage('assets/advantages_ru/star_3.svg');

  /// File path: assets/advantages_ru/t2g1.svg
  SvgGenImage get t2g1 => const SvgGenImage('assets/advantages_ru/t2g1.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        fastDelivery,
        freeDelivery,
        oneTOneG,
        onlinePay,
        star1,
        star2,
        star3,
        t2g1
      ];
}

class $AssetsAdvantagesTkGen {
  const $AssetsAdvantagesTkGen();

  /// File path: assets/advantages_tk/fast_delivery.svg
  SvgGenImage get fastDelivery =>
      const SvgGenImage('assets/advantages_tk/fast_delivery.svg');

  /// File path: assets/advantages_tk/free_delivery.svg
  SvgGenImage get freeDelivery =>
      const SvgGenImage('assets/advantages_tk/free_delivery.svg');

  /// File path: assets/advantages_tk/online_payment.svg
  SvgGenImage get onlinePayment =>
      const SvgGenImage('assets/advantages_tk/online_payment.svg');

  /// File path: assets/advantages_tk/star_1.svg
  SvgGenImage get star1 => const SvgGenImage('assets/advantages_tk/star_1.svg');

  /// File path: assets/advantages_tk/star_2.svg
  SvgGenImage get star2 => const SvgGenImage('assets/advantages_tk/star_2.svg');

  /// File path: assets/advantages_tk/star_3.svg
  SvgGenImage get star3 => const SvgGenImage('assets/advantages_tk/star_3.svg');

  /// File path: assets/advantages_tk/t1g1.svg
  SvgGenImage get t1g1 => const SvgGenImage('assets/advantages_tk/t1g1.svg');

  /// File path: assets/advantages_tk/t2g1.svg
  SvgGenImage get t2g1 => const SvgGenImage('assets/advantages_tk/t2g1.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        fastDelivery,
        freeDelivery,
        onlinePayment,
        star1,
        star2,
        star3,
        t1g1,
        t2g1
      ];
}

class $AssetsAuthGen {
  const $AssetsAuthGen();

  /// File path: assets/auth/otp_page.svg
  SvgGenImage get otpPage => const SvgGenImage('assets/auth/otp_page.svg');

  /// File path: assets/auth/otp_success.svg
  SvgGenImage get otpSuccess =>
      const SvgGenImage('assets/auth/otp_success.svg');

  /// List of all assets
  List<SvgGenImage> get values => [otpPage, otpSuccess];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/jeans.jpg
  AssetGenImage get jeans => const AssetGenImage('assets/images/jeans.jpg');

  /// File path: assets/images/merch_banner.jpg
  AssetGenImage get merchBanner =>
      const AssetGenImage('assets/images/merch_banner.jpg');

  /// File path: assets/images/otp_logo.png
  AssetGenImage get otpLogo =>
      const AssetGenImage('assets/images/otp_logo.png');

  /// List of all assets
  List<AssetGenImage> get values => [jeans, merchBanner, otpLogo];
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

  static const $AssetsAdvantagesRuGen advantagesRu = $AssetsAdvantagesRuGen();
  static const $AssetsAdvantagesTkGen advantagesTk = $AssetsAdvantagesTkGen();
  static const $AssetsAuthGen auth = $AssetsAuthGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsLanguageGen language = $AssetsLanguageGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  static const String package = 'app_ui';

  final Size? size;
  final Set<String> flavors;

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
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = false;

  const SvgGenImage.vec(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  static const String package = 'app_ui';

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
    final BytesLoader loader;
    if (_isVecFormat) {
      loader = AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
      );
    }
    return SvgPicture(
      loader,
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
      colorFilter: colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => 'packages/app_ui/$_assetName';
}
