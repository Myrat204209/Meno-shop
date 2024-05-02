import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailsUnderlinedText extends StatelessWidget {
  const ProductDetailsUnderlinedText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '3 offers from (550 TMT)',
      style: UITextStyle.headline5.copyWith(
        color: UIColors.secondary,
        fontSize: 14.sp,
        decoration: TextDecoration.underline,
      ),
    );
  }
}
