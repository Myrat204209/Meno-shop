import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:meno_shop/l10n/l10n.dart';

final kCartDescriptionStyle = const AppTextStyle.text().md().regular();
final kCartPriceStyle = const AppTextStyle.text().md().medium();
final kCartTotalTextStyle = const AppTextStyle.text().md().semiBold();

class CartBottomSheet extends StatelessWidget {
  const CartBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Column(
      children: [
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
                Text(l10n.totalCost, style: kCartDescriptionStyle),
                Text('1234 TMT', style: kCartPriceStyle),
              ],
            ),
            const SizedBox(height: AppSpacing.lg),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(l10n.deliverySerice),
                Text('123 TMT', style: kCartPriceStyle),
              ],
            ),
            const SizedBox(height: AppSpacing.lg),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(l10n.discount, style: kCartDescriptionStyle),
                Text(' 12 TMT', style: kCartPriceStyle),
              ],
            ),
            const SizedBox(height: AppSpacing.lg),
            const Divider(),
            const SizedBox(height: AppSpacing.lg),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(l10n.totalPrice, style: kCartTotalTextStyle),
                Text('12345 TMT', style: kCartTotalTextStyle),
              ],
            ),
            const SizedBox(height: AppSpacing.lg),
          ],
        ),
      ],
    );
  }
}
