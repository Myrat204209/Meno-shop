import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:meno_shop/features/l10n/l10n.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                ProductListTile(),
                SizedBox(height: 10),
                ProductListTile(),
                SizedBox(height: 10),
                ProductListTile(),
                SizedBox(height: 10),
                ProductListTile(),
                ProductListTile(),
              ],
            ),
          ),
        ),
        Divider(
          color: AppColors.neutral.shade300,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: 10),
            const Icon(Icons.keyboard_arrow_down_outlined),
            const SizedBox(width: 10),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total price',
                ),
                Text(
                  '3678 TMT',
                ),
              ],
            ),
            const Expanded(child: SizedBox()),
            AppButton(
              buttonText: 'Cancel',
              onTap: () {},
            )
          ],
        ).paddingSymmetric(horizontal: 10),
      ],
    );
  }
}

class OrderInformationView extends StatelessWidget {
  const OrderInformationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.quaterniary,
      appBar: AppBar(
        title: const Text(
          'Order Information',
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            AppRadioButton(
              text: context.l10n.paymentMethod,
              values: [
                context.l10n.paymentMethodCash,
                context.l10n.paymentMethodTerminal,
              ],
            ),
            AppRadioButton(
              text: context.l10n.deliveryTime,
              values: const [
                '09:00 - 13:00',
                '13:00 - 17:00',
                '17:00 - 21:00',
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ProductListTile extends StatelessWidget {
  const ProductListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppImage(
            width: 90,
            height: 90,
            imageUrl: Assets.images.jeans.extendPath(),
          ),
          const SizedBox(width: 10),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Friends Printed',
                ),
                Text(
                  'Size: L - Color: Pink',
                ),
                SizedBox(height: 10),
                Text(
                  '140 TMT',
                ),
              ],
            ),
          ),
          const Expanded(child: SizedBox()),
          const Text(
            '8 pcs',
          )
        ],
      ),
    );
  }
}
