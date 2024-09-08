// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class AppTitledWithViewAllRow extends StatelessWidget {
  const AppTitledWithViewAllRow({
    super.key,
    this.onViewAllTap,
    required this.title,
    this.padding,
    this.viewAllText,
  });

  final VoidCallback? onViewAllTap;
  final String title;
  final double? padding;
  final String? viewAllText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AutoSizeText(
          title,
          style: AppTextStyle.text().lg().bold(),
        ),
        AppViewAllText(
          onTap: onViewAllTap,
          text: viewAllText,
        ),
      ],
    ).paddingSymmetric(horizontal: padding ?? 12);
  }
}

class AppViewAllText extends StatelessWidget {
  const AppViewAllText({
    super.key,
    this.onTap,
    this.text,
  });
  final VoidCallback? onTap;
  final String? text;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(
        text ?? 'View All',
        style:
            AppTextStyle.text().regular().sm().withColor(AppColors.secondary),
      ),
      onPressed: onTap,
    );
  }
}
