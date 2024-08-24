// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:data_provider/data_provider.dart';
import 'package:flutter/material.dart';

class AppProductItem extends StatelessWidget {
  const AppProductItem({
    super.key,
    required this.product,
    required this.onFavoriteAdded,
    required this.onCartAdded,
    required this.onTap,
    required this.locale,
  });
  final ProductItem product;
  final VoidCallback onFavoriteAdded;
  final VoidCallback onCartAdded;
  final VoidCallback onTap;
  final String locale;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final productName = product.name;
    final productImageLink = product.photo;
    final productFavorite = product.isFavorite;

    return AppBorderColorBox(
      expand: 2.0,
      borderColor: AppColors.neutral.shade300,
      child: SizedBox(
        width: size.width * 0.48,
        child: AspectRatio(
          aspectRatio: 155 / 286,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AspectRatio(
                  aspectRatio: 149 / 157,
                  child: Stack(
                    children: [
                      /// Product image
                      AppProductImage(
                        imageLink: productImageLink!.isNotEmpty
                            ? productImageLink.first.path
                            : 'null',
                      ),

                      /// Product favorite button and advantages icon
                      ProductFavoritesButton(
                        isFavorite: productFavorite ?? false,
                        onFavoriteAdded: onFavoriteAdded,
                      ),

                      // Positioned(
                      //   left: 5,
                      //   top: 5,
                      //   child:  product.advantages != null ?
                      //           product.advantages?.oneToOne == true ?

                      //   // child: Assets.advantages.presentPlus1.svg(
                      //   //   height: 47.h,
                      //   //   width: 47.w,
                      //   // ),
                      // ),
                    ],
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      child: Text(
                        productName!,
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
                ).paddingAll(5).paddingOnly(bottom: 5),
                // ProductDetailsPrices(price: price).paddingOnly(left: 5),

                // ProductAdvantagesList(),
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
    required this.discount,
  });
  final DiscountItem discount;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            '${discount.discountedPrice} TMT',
            style: AppTextStyle.text().lg().bold(),
          ),
        ),
        Expanded(
          child: Text(
            '${discount.originalPrice} TMT',
            style: AppTextStyle.text()
                .regular()
                .sm()
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
    required this.advantages,
  });
  final AdvantagesItem? advantages;
  @override
  Widget build(BuildContext context) {
    final advantagesJson = (advantages as JsonType).cast<String, bool>();
    final advantagesList = advantagesJson.keys
        .where((key) => advantagesJson[key] == true)
        .toList();
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: advantagesList.length,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) => ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: SizedBox(
            height: 46,
            width: 35,
          ),
        ).paddingOnly(
          left: 5,
        ),
      ),
    );
  }
}

class ProductFavoritesButton extends StatelessWidget {
  ProductFavoritesButton({
    super.key,
    required this.onFavoriteAdded,
    required this.isFavorite,
  });

  final VoidCallback onFavoriteAdded;
  final bool isFavorite;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 5,
      top: 5,
      child: RawMaterialButton(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        constraints: BoxConstraints(maxWidth: 40),
        onPressed: onFavoriteAdded,
        elevation: 3,
        fillColor: AppColors.quaterniary,
        padding: EdgeInsets.only(top: 2),
        shape: CircleBorder(),
        child: Icon(
          isFavorite ? Icons.favorite : Icons.favorite_border_outlined,
          size: 20,
          color: AppColors.secondary,
        ).paddingAll(3.5),
      ),
    );
  }
}

class AppProductImage extends StatelessWidget {
  const AppProductImage({
    super.key,
    required this.imageLink,
  });

  final String? imageLink;

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
            imageUrl: imageLink ?? '',
          ),
        ),
      ),
    );
  }
}
