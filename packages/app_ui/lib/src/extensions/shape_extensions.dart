import 'package:flutter/material.dart';

extension ShapeBorderX on ShapeBorder {
  static ShapeBorder roundedRectangle(double radius, [Color? color]) {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(radius),
      side: color != null ? BorderSide(color: color) : BorderSide.none,
    );
  }

  static ShapeBorder verticalRectangle(double radius, [Color? color]) {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(radius)),
      side: color != null ? BorderSide(color: color) : BorderSide.none,
    );
  }
}
