// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class AuthPrivacyPolicyView extends StatelessWidget {
  const AuthPrivacyPolicyView({
    super.key,
    required this.onTap,
  });
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: AppColors.transparent,
      child: RichText(
        textAlign: TextAlign.left,
        softWrap: true,
        maxLines: 2,
        text: TextSpan(
          text: 'Dowam etmek bilen Men',
          style: const AppTextStyle.text()
              .xs()
              .regular()
              .copyWith(color: Colors.black),
          children: <TextSpan>[
            TextSpan(
              text: ' gizlinlik syýasatyny we\n',
              style: const AppTextStyle.text()
                  .xs()
                  .regular()
                  .withColor(Colors.blue),
            ),
            TextSpan(
              text: ' ulanmak düzgünlerini',
              style: const AppTextStyle.text()
                  .xs()
                  .regular()
                  .withColor(Colors.blue),
            ),
            TextSpan(
              text: ' kabul edýärin',
              style: const AppTextStyle.text()
                  .xs()
                  .regular()
                  .withColor(Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
