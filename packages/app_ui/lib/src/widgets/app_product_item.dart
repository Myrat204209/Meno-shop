// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class AppProductItem extends StatelessWidget {
  const AppProductItem({
    super.key,
    required this.onTap,
    required this.image,
    required this.price,
    required this.label,
  });

  final VoidCallback onTap;
  final String? image;
  final double price;
  final String label;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AppBorderColorBox(
      expand: 2.0,
      borderColor: AppColors.neutral.shade300,
      child: SizedBox(
        width: size.width * 0.49,
        child: AspectRatio(
          aspectRatio: 155.w / 286.h,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AspectRatio(
                  aspectRatio: 149.w / 157.h,
                  child: Stack(
                    children: [
                      AppProductImage(imageLink: image ?? ''),
                      ProductFavoritesButton(),
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
                        label,
                        softWrap: true,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyle.text()
                            .semiBold()
                            .sm()
                            .withColor(AppColors.primary),
                      ),
                    ),
                    AppButton.icon(
                      onTap: onTap,
                    ).paddingOnly(left: 7),
                  ],
                ).paddingAll(5),
                ProductDetailsPrices(price: price).paddingOnly(left: 5),
                SizedBox(height: 5),
                ProductAdvantagesList(),
              ],
            ),
          ),
        ),
      ),
    ).paddingOnly(right: 10);
  }
}

class ProductDetailsPrices extends StatelessWidget {
  const ProductDetailsPrices({
    super.key,
    required this.price,
  });

  final double price;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            '${price.toInt()} TMT',
            style: AppTextStyle.text().lg().bold().sp(),
          ),
        ),
        Expanded(
          child: Text(
            '1400 TMT',
            style: AppTextStyle.text()
                .regular()
                .sm()
                .sp()
                .copyWith(decoration: TextDecoration.lineThrough),
          ),
        )
      ],
    );
  }
}

class ProductAdvantagesList extends StatelessWidget {
  const ProductAdvantagesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: 4,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) => ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: SizedBox(
            height: 46.h,
            width: 35.w,
            child: Assets.advantages.fastDelivery.svg(fit: BoxFit.fitWidth),
          ),
        ).paddingOnly(
          left: 5,
        ),
      ),
    );
  }
}

class ProductFavoritesButton extends StatelessWidget {
  const ProductFavoritesButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 5,
      top: 5,
      child: RawMaterialButton(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
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
