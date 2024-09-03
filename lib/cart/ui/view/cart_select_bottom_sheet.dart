import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meno_shop/app/app.dart';
import 'package:meno_shop/cart/cart.dart';

Future<void> showCartSelectBottomSheet({
  required BuildContext context,
}) async =>
    showModalBottomSheet(
      context: context,
      useSafeArea: true,
      isScrollControlled: true,
      builder: (_) => const CartBottomSheet(),
    );

class CartBottomSheet extends StatelessWidget {
  const CartBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBottomSheet(
      bottomModalChildren: [
        Text(
          'Price',
          style: const AppTextStyle.text().headline6().semiBold(),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: AppSpacing.lg),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total cost of good'),
                Text('1234 TMT'),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Delivery service'),
                Text('123 TMT'),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Discount '),
                Text('12 TMT'),
              ],
            ),
            const Divider(),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total price'),
                Text('12345 TMT'),
              ],
            ),
            SizedBox(
              child: CartBottomActionRow(
                onBottomRowTap: () => context.pop(),
                onButtonPressed: () =>
                    context.pushNamed(RouteNames.addresses.name),
                totalPrice: 1234,
                buttonText: 'Confirm cart',
              ),
            )
          ],
        ),
      ],
    );
  }
}
