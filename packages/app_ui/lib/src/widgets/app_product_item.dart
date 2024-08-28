// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:data_provider/data_provider.dart';
import 'package:flutter/material.dart';

class AppProductItem extends StatelessWidget {
  const AppProductItem({
    super.key,
    required this.photoPath,
    required this.name,
    required this.price,
    required this.originalPrice,
    required this.isFavorite,
    required this.advantages,
    required this.onCartAdded,
    required this.onFavoriteAdded,
    required this.onProductPressed,
  });
  final String? photoPath;
  final String name;
  final double price;
  final double? originalPrice;
  final bool isFavorite;
  final AdvantagesItem? advantages;
  final VoidCallback? onCartAdded;
  final VoidCallback onFavoriteAdded;
  final VoidCallback onProductPressed;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return AppWrapper(
      expand: 2.0,
      borderColor: AppColors.neutral.shade300,
      child: SizedBox(
        width: size.width * 0.48,
        child: AspectRatio(
          aspectRatio: 155 / 286,
          child: InkWell(
            onTap: onProductPressed,
            borderRadius: BorderRadius.circular(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AspectRatio(
                  aspectRatio: 149 / 157,
                  child: Stack(
                    children: [
                      /// Product image

                      AppProductImage(imageLink: photoPath),

                      /// Product favorite button and advantages icon
                      ProductFavoritesButton(
                        isFavorite: isFavorite,
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
                        name,
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
                      onTap: onCartAdded,
                    ).paddingOnly(left: 7),
                  ],
                ).paddingAll(5).paddingOnly(bottom: 5),
                ProductDetailsPrices(price: price).paddingOnly(left: 5),

                // ProductAdvantagesList(
                //   advantages: product.advantages,
                // ),
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
    this.originalPrice,
  });
  final double price;
  final double? originalPrice;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            '$price TMT',
            style: AppTextStyle.text().lg().bold(),
          ),
        ),
        if (originalPrice != null)
          Expanded(
            child: Text(
              '$originalPrice TMT',
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
          child: AppImage(imageUrl: imageLink),
        ),
      ),
    );
  }
}
