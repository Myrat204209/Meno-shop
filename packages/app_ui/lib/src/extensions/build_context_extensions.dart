import 'package:flutter/material.dart';

extension GetSize on BuildContext {
  Size size() => MediaQuery.of(this).size;
}
