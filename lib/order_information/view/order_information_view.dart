import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

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
            const ProductListTile(),
            const SizedBox(height: 10),
            const ProductListTile(),
            const SizedBox(height: 10),
            const ProductListTile(),
            const SizedBox(height: 10),
            const ProductListTile(),
            const SizedBox(height: 220),
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
                  buttonText: 'Buy Again',
                  onTap: () {},
                )
              ],
            )
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
          Assets.images.jeans.image(
            height: 90,
            width: 90,
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
