// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailsDescriptionText extends StatelessWidget {
  const ProductDetailsDescriptionText({
    super.key,
    required this.descriptionText,
  });
  final String descriptionText;
  @override
  Widget build(BuildContext context) {
    return Text(
      '''Lorem ipsum dolor sit amet, consectetur adipiscing elit.sadbj 
      Morbi non erat quam.Vestibulum aliquam nibh dui, et aliquet nibh euismod quis.''',
      style: UITextStyle.subtitle1.copyWith(
        color: UIColors.neutral.shade500,
        fontSize: 12.sp,
        fontWeight: AppFontWeight.regular,
      ),
    );
  }
}
