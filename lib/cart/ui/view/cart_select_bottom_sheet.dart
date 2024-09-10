import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meno_shop/app/app.dart';
import 'package:meno_shop/cart/cart.dart';
import 'package:meno_shop/l10n/l10n.dart';

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
    final l10n = context.l10n;
    return AppBottomSheet(
      bottomModalChildren: [
        Text(
          context.l10n.price,
          style: const AppTextStyle.text().headline6().semiBold(),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: AppSpacing.lg),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(l10n.totalCost),
                const Text('1234 TMT'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(l10n.deliverySerice),
                const Text('123 TMT'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(l10n.discount),
                const Text(' 12 TMT'),
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(l10n.totalPrice),
                const Text('12345 TMT'),
              ],
            ),
            SizedBox(
              child: CartBottomActionRow(
                onBottomRowTap: () => context.pop(),
                onButtonPressed: () =>
                    context.pushNamed(RouteNames.addresses.name),
                totalPrice: 1234,
                buttonText: l10n.cartConfirmation,
              ),
            )
          ],
        ),
      ],
    );
  }
}
