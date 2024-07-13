// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class AppTitledWithViewAllRow extends StatelessWidget {
  const AppTitledWithViewAllRow({
    super.key,
    required this.title,
    this.padding,
    this.onViewAllTap,
  });

  final VoidCallback? onViewAllTap;
  final String title;
  final double? padding;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AutoSizeText(
          title,
          style: AppTextStyle.text().lg().bold(),
        ),
        AppViewAllText(onTap: onViewAllTap),
      ],
    ).paddingSymmetric(horizontal: padding ?? 12);
  }
}

class AppViewAllText extends StatelessWidget {
  const AppViewAllText({
    super.key,
    this.onTap,
  });
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(
        'View All',
        style:
            AppTextStyle.text().regular().sm().withColor(AppColors.secondary2),
      ),
      onPressed: onTap,
    );
  }
}

class AppDefaultLabelTextWidget extends StatelessWidget {
  const AppDefaultLabelTextWidget({
    super.key,
    required this.label,
  });
  final String label;
  @override
  Widget build(BuildContext context) {
    return Text(
      label,
    );
  }
}
