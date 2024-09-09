// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:flexi_image_slider/flexi_image_slider.dart';
import 'package:flutter/material.dart';

class ProductDetailsImageSlider extends StatelessWidget {
  const ProductDetailsImageSlider({
    super.key,
    required this.imageLinks,
  });
  final List<String>? imageLinks;
  @override
  Widget build(BuildContext context) {
    return AppWrapper(
      borderColor: AppColors.primary.withOpacity(0.1),
      expand: 3,
      child: imageLinks!.isEmpty
          ? Assets.images.otpLogo
              .image(
                width: 328,
                height: 235,
                fit: BoxFit.cover,
              )
              .centralize()
          : flexi_image_slider(
              context: context,
              duration: const Duration(seconds: 3),
              indicatorAlignment: IndicatorAlignment.center,
              indicatorActiveColor: AppColors.secondary,
              indicatorPosition: IndicatorPosition.overImage,
              indicatorDeactiveColor: AppColors.neutral.shade300,
              aspectRatio: 15 / 11,
              arrayImages: imageLinks!,
              boxFit: BoxFit.cover,
              borderRadius: 8,
            ),
    );
  }
}
