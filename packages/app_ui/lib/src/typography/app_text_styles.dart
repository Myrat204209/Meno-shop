import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

abstract class UITextStyle {
  static const _baseTextStyle = TextStyle(
    package: 'app_ui',
    fontWeight: AppFontWeight.regular,
    fontFamily: 'Poppins',
    decoration: TextDecoration.none,
    textBaseline: TextBaseline.alphabetic,
  );
  static final TextStyle headline4 = _baseTextStyle.copyWith(
    fontSize: 24,
    fontWeight: AppFontWeight.bold,
    height: 1.5,
  );
  static final TextStyle headline5 = _baseTextStyle.copyWith(
    fontSize: 24,
    fontWeight: AppFontWeight.semiBold,
    height: 1.5,
  );
  static final TextStyle headline6 = _baseTextStyle.copyWith(
    fontSize: 18,
    fontWeight: AppFontWeight.medium,
    height: 1.5,
  );
  static final TextStyle subtitle1 = _baseTextStyle.copyWith(
    fontSize: 16,
    fontWeight: AppFontWeight.medium,
    height: 1.5,
  );
  static final TextStyle subtitle2 = _baseTextStyle.copyWith(
    fontSize: 14,
    fontWeight: AppFontWeight.medium,
    height: 1.5,
  );
}
