// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:developer';

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class AppProductItem extends StatelessWidget {
  const AppProductItem({
    super.key,
    this.onTap,
    required this.image,
    required this.price,
    required this.label,
    required this.category,
  });

  final VoidCallback? onTap;
  final String? image;
  final double price;
  final String label;
  final String category;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AppBorderColorBox(
      expand: 2.0,
      borderColor: AppColors.neutral.shade300,
      child: SizedBox(
        width: size.width * 0.46,
        child: AspectRatio(
          aspectRatio: 155.w / 281.h,
          child: InkWell(
            onTap: () => log('message'),
            borderRadius: BorderRadius.circular(10),
            child: Column(
              children: [
                AspectRatio(
                  aspectRatio: 149.w / 157.h,
                  child: Stack(
                    children: [
                      AppProductImage(imageLink: image ?? ''),
                      Positioned(
                        right: 5,
                        top: 5,
                        child: RawMaterialButton(
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          constraints: BoxConstraints(maxWidth: 40),
                          onPressed: () {},
                          elevation: 3,
                          fillColor: AppColors.quaterniary,
                          padding: EdgeInsets.only(top: 2),
                          shape: CircleBorder(),
                          child: Icon(
                            Icons.favorite,
                            size: 20.h,
                            color: AppColors.secondary,
                          ).paddingAll(3.5),
                        ),
                      ),
                      Positioned(
                        left: 5,
                        top: 5,
                        child: Assets.advantages.presentPlus1.svg(
                          height: 47.h,
                          width: 47.w,
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      child: Text(
                        label * 4,
                        softWrap: true,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyle.text()
                            .semiBold()
                            .xs()
                            .withColor(AppColors.primary),
                      ),
                    ),
                    AppButton(
                      type: AppButtonType.small,
                      text: null,
                      onTap: () {
                        //TODO: Go to the Orders Page
                      },
                    ).paddingOnly(left: 7),
                  ],
                ).paddingAll(5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        '${price.toInt()} TMT',
                        style: AppTextStyle.text().md().bold().sp(),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        '1400 TMT',
                        style: AppTextStyle.text()
                            .sm()
                            .regular()
                            .sp()
                            .copyWith(decoration: TextDecoration.lineThrough),
                      ),
                    )
                  ],
                ).paddingAll(5),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: SizedBox(
                        height: 45.h,
                        width: 35.w,
                        child: Assets.advantages.fastDelivery
                            .svg(fit: BoxFit.cover),
                      ),
                    ).paddingOnly(right: 5),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: SizedBox(
                        height: 45.h,
                        width: 35.w,
                        child: Assets.advantages.freeDelivery
                            .svg(fit: BoxFit.cover),
                      ),
                    ).paddingOnly(right: 5),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: SizedBox(
                        height: 45.h,
                        width: 35.w,
                        child:
                            Assets.advantages.payOnline.svg(fit: BoxFit.cover),
                      ),
                    ).paddingOnly(right: 5),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: SizedBox(
                        height: 45.h,
                        width: 35.w,
                        child: Assets.advantages.advantageProduct
                            .svg(fit: BoxFit.cover),
                      ),
                    ).paddingOnly(right: 5),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ).paddingOnly(right: 10);
  }
}

class AppProductContentText extends StatelessWidget {
  const AppProductContentText({
    super.key,
    required this.category,
    required this.label,
  });

  final String category;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Gap(6.h),
        Text(
          label,
          maxLines: 5,
          softWrap: true,
          style: AppTextStyle.text().semiBold().sm().sp(),
        ),
        Gap(5),
      ],
    );
  }
}

class AppProductImage extends StatelessWidget {
  const AppProductImage({
    super.key,
    required this.imageLink,
  });

  final String imageLink;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.maxFinite,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: AppBorderColorBox(
            expand: 0.5,
            borderColor: AppColors.neutral.shade300,
            child: AppImage(
              imageUrl: imageLink,
              imageType: ImageType.cached,
              width: double.infinity,
            )),
      ),
    );
  }
}
