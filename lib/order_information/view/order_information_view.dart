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
        title: Text(
          context.l10n.orderInformation,
        ),
        centerTitle: true,
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
                height: 80,
                width: 80,
                fit: BoxFit.cover,
              )
              .colorize(Colors.yellow)
              .clipper(10)
              .paddingOnly(bottom: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cart.productName,
                style: const AppTextStyle.text().lg().semiBold(),
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
                '${cart.price.toStringAsPrecision(2)} TMT',
                style: const AppTextStyle.text().semiBold(),
              ),
            ],
          ).paddingSymmetric(vertical: 4, horizontal: 10),
          const Expanded(child: SizedBox()),
          Text('${cart.quantity}')
        ],
      ),
    ).paddingSymmetric(horizontal: 10);
  }
}
