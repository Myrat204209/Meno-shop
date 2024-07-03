// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:developer';

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
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
    return SizedBox(
      width: size.width * 0.45,
      child: AspectRatio(
        aspectRatio: 155 / 292,
        child: InkWell(
          onTap: () => log('message'),
          borderRadius: BorderRadius.circular(10),
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 155 / 160,
                child: Stack(
                  children: [
                    AppProductImage(imageLink: image ?? ''),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: AppProductContentText(
                                category: category,
                                label: label,
                              ),
                            ),
                            AppButton(
                              type: AppButtonType.small,
                              text: null,
                              onTap: () {
                                //TODO: Go to the Orders Page
                              },
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              '${price.toInt()} TMT',
                              style: AppTextStyle.text().lg().semiBold(),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              '1400 TMT',
                              style: AppTextStyle.text().md().bold().copyWith(
                                  decoration: TextDecoration.lineThrough),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 45,
                            width: 35,
                            child: ColoredBox(color: Colors.amber),
                          ),
                          SizedBox(
                            height: 45,
                            width: 35,
                            child: ColoredBox(color: Colors.green),
                          ),
                          SizedBox(
                            height: 45,
                            width: 35,
                            child: ColoredBox(color: Colors.teal),
                          ),
                          SizedBox(
                            height: 45,
                            width: 35,
                            child: ColoredBox(color: Colors.pink),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
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
      children: [
        Text(
          category,
          softWrap: true,
          maxLines: 3,
        ),
        Gap(5),
        Text(
          label,
          maxLines: 3,
          softWrap: true,
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
