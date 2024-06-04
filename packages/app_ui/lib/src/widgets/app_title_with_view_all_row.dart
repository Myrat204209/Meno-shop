// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
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
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: padding ?? 0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: UITextStyle.headline4.copyWith(
              color: UIColors.primary,
              fontSize: 16,
            ),
          ),
          AppViewAllText(onTap: onViewAllTap),
        ],
      ),
    );
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
        style: UITextStyle.subtitle2.copyWith(
          color: UIColors.secondary,
          fontWeight: FontWeight.w400,
          fontSize: 12,
        ),
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
      style: UITextStyle.headline4.copyWith(
        color: UIColors.primary,
        fontSize: 20,
      ),
    );
  }
}
