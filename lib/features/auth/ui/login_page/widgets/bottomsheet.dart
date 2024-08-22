import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class BottomShet extends StatelessWidget {
  const BottomShet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // Ekran boyutlarını almak için MediaQuery kullanılır
    final screenWidth = size.width;
    final screenHeight = size.height;

    return SizedBox(
      width: screenWidth,
      height: screenHeight * 0.6, // Ekran yüksekliğinin %60'ı kadar yükseklik
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.cancel_outlined,
                size: 25,
                color: AppColors.tertiary,
              ),
            ),
          ),
          Text("ALMALY",
              style: const AppTextStyle.text()
                  .regular()
                  .sm()
                  .withColor(AppColors.primary)),
          Center(
            child: SizedBox(
              width: 250,
              height: 100,
              child: Text(
                'GIZLINLIK SYYASATY WE ULANYS DUZGUNERI',
                style: const AppTextStyle.text()
                    .withColor(AppColors.primary)
                    .bold()
                    .xl(),
                textAlign: TextAlign.center,
                overflow: TextOverflow.visible,
              ).paddingOnly(top: 20),
            ),
          ),
          Text(
            "1. Introduction",
            style: const AppTextStyle.text()
                .withColor(AppColors.primary)
                .bold()
                .md(),
          ).paddingOnly(left: 20),
          Text(
            "Welcome to ALMALY.  We are committed to protecting your privacy and ensuring the security of your personal information. This Privacy Policy explains how we collect, use, disclose, and safeguard your information when you use our mobile application (the \"App\").Please read this Privacy Policy carefully. If you do not agree with the terms of this Privacy Policy, please do not access the App.",
            style: const AppTextStyle.text()
                .withColor(AppColors.primary)
                .regular()
                .md(),
          ).paddingSymmetric(horizontal: 10, vertical: 10)
        ],
      ),
    );
  }
}
