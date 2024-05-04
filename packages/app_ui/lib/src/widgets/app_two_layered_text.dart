import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTwoLayeredTextWidget extends StatelessWidget {
  const AppTwoLayeredTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '1400 TMT',
          style: UITextStyle.subtitle2.copyWith(
            color: UIColors.primary,
            fontSize: 12.sp,
            decoration: TextDecoration.lineThrough,
          ),
        ),
        Text(
          '550 TMT',
          style: UITextStyle.headline4.copyWith(
            color: UIColors.primary,
            fontSize: 14.sp,
          ),
        ),
        // const Text()
      ],
    );
  }
}
