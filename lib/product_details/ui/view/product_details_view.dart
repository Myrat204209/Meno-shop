import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

import '../ui.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ProductDetailsImageSlider(imageLinks: [
            'https',
            'https',
          ]),
          Text(
            'Friends Printed',
            style: const AppTextStyle.text().headline6().semiBold(),
          ).paddingSymmetric(vertical: 10),
          ListTile(
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
          ),
          ListTile(
            contentPadding: const EdgeInsets.only(left: 0),
            leading: const ProductDetailsPercentBox(onSalePercent: 50),
            title: Text(
              '1400 TMT',
              style: const AppTextStyle.text()
                  .sm()
                  .regular()
                  .copyWith(decoration: TextDecoration.lineThrough),
            ),
            subtitle: Text(
              '500 TMT',
              style: const AppTextStyle.text().lg().bold(),
            ),
            trailing: Text(
              '3 offers from (550 TMT)',
              style: const AppTextStyle.text().md().semiBold().copyWith(
                    decoration: TextDecoration.underline,
                    color: AppColors.secondary2,
                  ),
            ),
            isThreeLine: true,
          ),
          ListTile(
            contentPadding: const EdgeInsets.only(left: 0),
            isThreeLine: true,
            title: Text(
              '212 reviews',
              style: const AppTextStyle.text().lg().semiBold(),
            ),
            subtitle: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi non erat quam. Vestibulum aliquam nibh dui, et aliquet nibh euismod quis.',
                    style: const AppTextStyle.text()
                        .sm()
                        .regular()
                        .withColor(AppColors.neutral.shade500))
                .paddingOnly(top: 10),
          ),
          const SizedBox(height: 10),
          Text(
            'Choose color',
            style: const AppTextStyle.text().lg().semiBold(),
          ),
          const SizedBox(height: 10),
          const ProductDetailsColorSelector(
            colors: [
              Colors.red,
              Colors.black,
              Colors.blue,
              Colors.green,
            ],
            checkedColorIndex: 0,
          ),
          const SizedBox(height: 20),
          Text(
            'Select size',
            style: const AppTextStyle.text().lg().semiBold(),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 10,
            children: sizes
                .map((element) => ProductSizeChip(
                      isSelected: element == 'S' ? true : false,
                      label: element,
                    ))
                .toList(),
          ),
          const SizedBox(height: 20),
          Text(
            'Similar Goods',
            style: const AppTextStyle.text().bold().xl(),
          ),
        ],
      ),
    );
  }
}

const List<String> sizes = ['S', 'M', 'L', 'XL', 'XXL'];
