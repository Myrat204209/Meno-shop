import 'package:flutter/material.dart';

IconData getOutlinedIcon(IconData iconData) {
  return IconData(
    iconData.codePoint,
    fontFamily: 'MaterialIconsOutlined',
  );
}
