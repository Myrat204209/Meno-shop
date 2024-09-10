// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:data_provider/data_provider.dart';
import 'package:flutter/material.dart';

class ProductDetailsDiscount extends StatelessWidget {
  const ProductDetailsDiscount({
    super.key,
    required this.price,
    this.discount,
  });
  final double price;
  final DiscountItem? discount;
  @override
  Widget build(BuildContext context) {
    if (discount == null) {
      return Text(
        '$price TMT',
        style: const AppTextStyle.text().xl().bold(),
      );
    }

    return ListTile(
      contentPadding: const EdgeInsets.only(left: 0),
      leading: Material(
        color: AppColors.starsColor,
        shape: ShapeBorderX.roundedRectangle(10),
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxHeight: 65,
            maxWidth: 57,
          ),
          child: Text(
            '-${discount?.percentage}%',
            style: const AppTextStyle.text()
                .lg()
                .bold()
                .withColor(AppColors.quaterniary),
          ).centralize(),
        ),
      ),
      title: Text(
        '${discount?.originalPrice} TMT',
        style: const AppTextStyle.text()
            .sm()
            .regular()
            .copyWith(decoration: TextDecoration.lineThrough),
      ),
      subtitle: Text(
        '${discount?.discountedPrice} TMT',
        style: const AppTextStyle.text().lg().bold(),
      ),
      // trailing: Text(
      //   '3 offers from (550 TMT)',
      //   style: const AppTextStyle.text().md().semiBold().copyWith(
      //         decoration: TextDecoration.underline,
      //         color: AppColors.secondary2,
      //       ),
      // ),
      // isThreeLine: true,
    );
  }
}

class ProductDetailsProductOffers extends StatelessWidget {
  const ProductDetailsProductOffers({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.only(left: 0),
      minTileHeight: 10,
      leading: Text(
        'Offer Ends In:',
        style: const AppTextStyle.text()
            .regular()
            .sm()
            .withColor(AppColors.neutral.shade700),
      ),
      title: Text(
        '2 days, 12 : 44 : 48',
        style: const AppTextStyle.text()
            .sm()
            .semiBold()
            .withColor(AppColors.starsColor),
      ),
    );
  }
}

class ProductDetailsDescriptionText extends StatelessWidget {
  const ProductDetailsDescriptionText({
    super.key,
    required this.description,
  });
  final String description;
  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      // 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi non erat quam. Vestibulum aliquam nibh dui, et aliquet nibh euismod quis.',
      softWrap: true,
      style: const AppTextStyle.text()
          .sm()
          .regular()
          .withColor(AppColors.neutral.shade500),
    ).paddingSymmetric(vertical: 10);
  }
}

class ProductDetailsName extends StatelessWidget {
  const ProductDetailsName({
    super.key,
    required this.productName,
  });

  final String productName;

  @override
  Widget build(BuildContext context) {
    return Text(
      productName,
      style: const AppTextStyle.text().headline4().semiBold(),
    ).paddingSymmetric(vertical: 10);
  }
}
