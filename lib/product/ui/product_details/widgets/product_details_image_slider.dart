// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:flexi_image_slider/flexi_image_slider.dart';
import 'package:flutter/material.dart';

class ProductDetailsImageSlider extends StatelessWidget {
  const ProductDetailsImageSlider({
    super.key,
    required this.imageLinks,
  });
  final List<String> imageLinks;
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primary),
        borderRadius: BorderRadius.circular(10),
      ),
      child: flexi_image_slider(
        context: context,
        duration: const Duration(seconds: 3),
        indicatorAlignment: IndicatorAlignment.right,
        indicatorActiveColor: AppColors.secondary,
        indicatorPosition: IndicatorPosition.overImage,
        indicatorDeactiveColor: AppColors.neutral.shade300,
        aspectRatio: 15 / 11,
        arrayImages: imageLinks,
        boxFit: BoxFit.cover,
        borderRadius: 8,
      ),
    );
  }
}
