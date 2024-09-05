import 'package:app_ui/app_ui.dart';
import 'package:flutter_svg/flutter_svg.dart';

SvgPicture svgPictureFromAsset(String assetName) {
  return switch (assetName) {
    'ru' => Assets.language.russia.svg(width: 35, height: 27),
    'tk' => Assets.language.turkmen.svg(width: 35, height: 27),
    // 'en' => Assets.language.english.svg(width: 35, height: 27),
    String() => Assets.language.english.svg(width: 35, height: 27),
  };
}
