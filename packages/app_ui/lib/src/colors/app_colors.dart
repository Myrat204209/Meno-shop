import 'package:flutter/material.dart';

abstract class AppColors {
  ///Primary
  static const Color primary = Color(0xFF1B3363);

  /// Secondary

  static const Color secondary = Color(0xFFC01C15);

  static const Color secondary2 = Color(0xFF4F46E5);

  static const Color transparent = Colors.transparent;

  /// Stars color
  static const Color starsColor = Color(0xFFFBA13A);

  /// Accepted
  static const Color accepted = Color(0xFF009329);

  /// Notification color
  static const Color newMessage = Color(0xFF00D816);

  /// Tertiary
  static const Color tertiary = Color(0xFFCECECE);

  /// Quaterniary
  static const Color quaterniary = Color(0xFFFFFFFF);

  /// Neutral
  static const MaterialColor neutral = MaterialColor(0xFFFFFFFF, <int, Color>{
    0: Color(0xFFFFFFFF),
    50: Color(0xFFE4E4E4),
    100: Color(0xAAF8FAFC),
    200: Color(0xFFF8FAFC),
    300: Color(0xFFDFE5EC),
    400: Color(0xFFEBEBEB),
    500: Color(0xFF94A3B8),
    600: Color(0xFF757575),
    700: Color(0xFF64748B),
    800: Color(0xFFD9D9D9),
    900: Color(0xFF334155),
  });
}
