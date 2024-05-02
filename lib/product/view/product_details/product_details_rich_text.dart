import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailRichText extends StatelessWidget {
  const ProductDetailRichText({
    super.key,
  });
  //TODO: Not enough information
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'Offer Ends In:  ',
        style: UITextStyle.headline6.copyWith(
          fontSize: 15.sp,
          color: UIColors.neutral.shade700,
        ),
        children: [
          TextSpan(
            text: '2 days, 12 : 44 : 48',
            style: UITextStyle.headline5.copyWith(
              color: UIColors.starsColor,
              fontSize: 16.sp,
            ),
          ),
        ],
      ),
    );
  }
}
