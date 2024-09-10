// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:data_provider/data_provider.dart';
import 'package:flutter/material.dart';

import 'package:meno_shop/l10n/l10n.dart';

class OrderInformationView extends StatelessWidget {
  const OrderInformationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.quaterniary,
      appBar: AppBar(
        title: Text(context.l10n.orderInformation),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            const Divider(
              color: AppColors.primary,
              thickness: 0,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(Icons.arrow_downward),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(context.l10n.totalPrice),
                    const Text('3678 TMT'),
                  ],
                ),
                const Expanded(child: SizedBox()),
                AppButton(
                  buttonText: 'Buy Again',
                  onTap: () {},
                  textColor: AppColors.quaterniary,
                  color: AppColors.secondary,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class AppListTile extends StatelessWidget {
  const AppListTile({
    super.key,
    required this.cart,
  });
  final CartItem cart;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Assets.images.jeans
              .image(
                height: 70,
                width: 70,
                fit: BoxFit.cover,
              )
              .colorize(Colors.yellow)
              .clipper(10)
              .paddingOnly(bottom: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 160,
                child: Text(
                  "cart.productNameasdl;askd;lksa",
                  overflow: TextOverflow.ellipsis,
                  style: const AppTextStyle.text().md().medium(),
                ),
              ),
              // Text(
              //   'Size: L - Color: Pink',
              //   style: const AppTextStyle.text()
              //       .xs()
              //       .regular()
              //       .withColor(AppColors.neutral.shade700),
              // ),
              const SizedBox(height: 10),
              Text(
                "",
                // '${cart .price.toStringAsPrecision(2)} TMT',
                style: const AppTextStyle.text().semiBold(),
              ),
            ],
          ).paddingSymmetric(vertical: 6, horizontal: 8),
          const Expanded(child: SizedBox()),
          CartCounter(
            addOneButton: () {},
            removeOneButton: () {},
            counterQuantity: 2,
          ),
        ],
      ),
    ).paddingSymmetric(horizontal: 10);
  }
}

class CartCounter extends StatelessWidget {
  const CartCounter({
    super.key,
    required this.addOneButton,
    required this.removeOneButton,
    required this.counterQuantity,
  });
  final VoidCallback addOneButton;
  final VoidCallback removeOneButton;
  final int counterQuantity;
  @override
  Widget build(BuildContext context) {
    return AppWrapper(
      borderColor: AppColors.neutral.shade300,
      expand: 1,
      child: SizedBox(
        width: 118,
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: removeOneButton,
              icon: const Icon(
                Icons.remove,
                size: 25,
                color: AppColors.primary,
              ),
            ),
            Text(
              '$counterQuantity',
              style: const AppTextStyle.text().md().semiBold(),
            ),
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: addOneButton,
              icon: const Icon(
                Icons.add,
                size: 25,
                color: AppColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
