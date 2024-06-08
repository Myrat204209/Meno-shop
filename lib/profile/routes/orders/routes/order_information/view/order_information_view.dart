import 'package:app_ui/app_ui.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class OrderInformationView extends StatelessWidget {
  const OrderInformationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColors.quaterniary,
      appBar: AppBar(
        title: Text(
          'Order Information',
          style: UITextStyle.headline5.copyWith(
            color: UIColors.primary,
          ),
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
              color: UIColors.primary,
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
                    Text(
                      'Total price',
                      style: UITextStyle.subtitle2.copyWith(
                        color: UIColors.primary,
                      ),
                    ),
                    Text(
                      '3678 TMT',
                      style: UITextStyle.headline5.copyWith(
                        color: UIColors.primary,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
                const Expanded(child: SizedBox()),
                AppButton(
                  text: 'Buy Again',
                  onTap: () {},
                  type: AppButtonType.standard,
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
          CachedNetworkImage(
            imageUrl: 'assets/friends.jpg',
            fit: BoxFit.cover,
            width: 90,
            height: 90,
          ),
          const SizedBox(width: 10),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Friends Printed',
                  style: UITextStyle.headline5
                      .copyWith(color: UIColors.primary, fontSize: 18),
                ),
                Text(
                  'Size: L - Color: Pink',
                  style: UITextStyle.subtitle2
                      .copyWith(color: UIColors.neutral.shade700, fontSize: 14),
                ),
                const SizedBox(height: 10),
                Text(
                  '140 TMT',
                  style: UITextStyle.headline5
                      .copyWith(color: UIColors.primary, fontSize: 16),
                ),
              ],
            ),
          ),
          const Expanded(child: SizedBox()),
          Text(
            '8 pcs',
            style: UITextStyle.headline5
                .copyWith(color: UIColors.primary, fontSize: 14),
          )
        ],
      ),
    );
  }
}
