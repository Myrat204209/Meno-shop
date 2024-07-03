// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

class AppBorderColorBox extends StatelessWidget {
  const AppBorderColorBox({
    super.key,
    required this.borderColor,
    required this.child,
    this.expand = 1,
  });
  final double expand;
  final Color borderColor;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.all(2.0 * expand),
        child: child,
      ),
    );
  }
}
