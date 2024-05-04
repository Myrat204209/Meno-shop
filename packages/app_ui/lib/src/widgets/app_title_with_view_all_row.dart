// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

part 'app_view_all_text.dart';

class AppTitledWithViewAllRow extends StatelessWidget {
  const AppTitledWithViewAllRow({
    super.key,
    required this.title,
    this.padding,
  });
  final String title;
  final double? padding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 20.h,
        horizontal: padding ?? 0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: UITextStyle.headline4.copyWith(
              color: UIColors.primary,
              fontSize: 16.sp,
            ),
          ),
          const AppViewAllText(),
        ],
      ),
    );
  }
}
