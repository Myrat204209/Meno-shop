import 'package:flutter/material.dart';

abstract class UIColors {
  ///Primary
  static final Color primary = Color(0xFF1B3363);

  /// Secondary

  static const Color secondary = Color(0xFF4F46E5);

  static const Color secondary2 = Color(0xFFED0303);

  /// Stars color
  static const Color starsColor = Color(0xFFFBA13A);

  /// Accepted
  static const Color accepted = Color(0xFF009329);

  /// Tertiary
  static const Color tertiary = Color(0xFFCECECE);

  /// Quaterniary
  static const Color quaterniary = Color(0xFFFFFFFF);

  /// Neutral
  static const MaterialColor neutral = MaterialColor(0xFFFFFFFF, <int, Color>{
    0: Color(0xFFFFFFFF),
    100: Color(0xFFF8FAFC),
    300: Color(0xFFDFE5EC),
    500: Color(0xFF94A3B8),
    700: Color(0xFF64748B),
    900: Color(0xFF334155),
  });
}
