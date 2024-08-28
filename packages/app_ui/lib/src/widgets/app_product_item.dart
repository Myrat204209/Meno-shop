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
    required this.imageLink,
  });

  final ProductItem product;
  final VoidCallback onFavoriteAdded;
  final VoidCallback onCartAdded;
  final VoidCallback onTap;
  final String locale;
  final String imageLink;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final productName = product.name ?? 'Unnamed Product';
    final productImageLink = imageLink;
    final productFavorite = product.isFavorite ?? false;

    return AppWrapper(
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
                        imageLink: productImageLink.isNotEmpty
                            ? productImageLink
                            : 'null',
                      ),

                      /// Product favorite button and advantages icon
                      ProductFavoritesButton(
                        isFavorite: productFavorite,
                        onFavoriteAdded: onFavoriteAdded,
                      ),
                      // ProductAdvantageSticker(product: product),
                    ],
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      child: Text(
                        productName,
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

                ProductAdvantagesList(
                  locale: locale,
                  advantages: product.advantages,
                ),
              ],
            ),
          ),
        ),
      ),
    ).paddingOnly(right: 10);
  }
}

// class ProductAdvantageSticker extends StatelessWidget {
//   const ProductAdvantageSticker({
//     super.key,
//     required this.advantages,
//     required this.locale,
//   });

//   final AdvantagesItem advantages;
//   final String locale;

//   @override
//   Widget build(BuildContext context) {
//     return Positioned(
//       left: 5,
//       top: 5,
//       child: ,
//     );
//   }
// }

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
    required this.locale,
    required this.advantages,
  });

  final String locale;
  final AdvantagesItem? advantages;

  @override
  Widget build(BuildContext context) {
    final advantagesJson = advantages?.toJson();
    final advantagesList = advantagesJson?.keys
        .where((key) => advantagesJson[key] == true)
        .toList();

    if (advantagesList != null && advantagesList.isNotEmpty) {
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
              // Placeholder for advantage icons based on locale and advantage type
              // child: ((kAdvantagesJsonBody[locale][advantagesList[index]] != null)
              //         as SvgGenImage)
              //     .svg(fit: BoxFit.cover),
            ),
          ).paddingOnly(
            left: 5,
          ),
        ),
      );
    }

    return const SizedBox();
  }
}

class ProductFavoritesButton extends StatelessWidget {
  const ProductFavoritesButton({
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
        constraints: const BoxConstraints(maxWidth: 40),
        onPressed: onFavoriteAdded,
        elevation: 3,
        fillColor: AppColors.quaterniary,
        padding: const EdgeInsets.only(top: 2),
        shape: const CircleBorder(),
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
        child: AppWrapper(
          expand: 0.5,
          borderColor: AppColors.neutral.shade300,
          child: AppImage(
            imageUrl: imageLink ?? 'App_Product_Image',
          ),
        ),
      ),
    );
  }
}
