// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

import 'package:meno_shop/l10n/l10n.dart';

final kCartDescriptionStyle = const AppTextStyle.text().sm().regular();
final kCartPriceStyle = const AppTextStyle.text().sm().medium();
final kCartTotalTextStyle = const AppTextStyle.text().sm().semiBold();

class CartConfirmBottomSheetContent extends StatelessWidget {
  const CartConfirmBottomSheetContent({
    super.key,
    required this.totalCost,
  });
  final double totalCost;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Row(
            children: [
              const SizedBox(width: AppSpacing.xxlg),
              Expanded(
                child: Text(
                  l10n.price,
                  style: const AppTextStyle.text().semiBold().xl(),
                ).centralize(),
              ),
              IconButton(
                onPressed: () => context.pop(),
                color: AppColors.neutral.shade700,
                icon: const Icon(Icons.close_rounded),
              )
            ],
          ),
          CartCustomText(text: l10n.totalCost, price: totalCost),
          CartCustomText(text: l10n.deliverySerice, price: 20),
          CartCustomText(text: l10n.discount, price: 0),
          CartCustomText(
            text: l10n.totalPrice,
            price: totalCost - 20,
            isTotal: true,
          ),
          Divider(color: AppColors.neutral.shade300),
          CartModalSheet(totalCost: totalCost)
        ],
      ),
    );
  }
}

class CartCustomText extends StatelessWidget {
  const CartCustomText({
    super.key,
    required this.text,
    required this.price,
    this.isTotal = false,
  });
  final String text;
  final double price;
  final bool isTotal;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "$text: ",
          style: !isTotal ? kCartDescriptionStyle : kCartTotalTextStyle,
        ),
        Text(
          "$price TMT",
          style: !isTotal ? kCartPriceStyle : kCartTotalTextStyle,
        ),
      ],
    ).paddingSymmetric(vertical: 5);
  }
}

class CartModalSheet extends HookWidget {
  const CartModalSheet({
    super.key,
    required this.totalCost,
    this.actionNeeded = false,
  });
  final double totalCost;
  final bool actionNeeded;

  @override
  Widget build(BuildContext context) {
    final isExpanded = useState(false);
    void toggle() {
      AppBottomSheet.show(
        context: context,
        useRootNavigator: false,
        bottomModalChildren:
            CartConfirmBottomSheetContent(totalCost: totalCost),
      );

      isExpanded.value = !isExpanded.value;
    }

    return InkWell(
      onTap: !actionNeeded ? null : toggle,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ExpandIcon(
            onPressed: (value) {},
            expandedColor: AppColors.secondary,
            size: 34,
            color: AppColors.secondary,
            isExpanded: !isExpanded.value,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                context.l10n.totalPrice,
                style: kCartDescriptionStyle,
              ),
              Text(
                '${20} TMT',
                style: kCartPriceStyle,
              ),
            ],
          ),
          const Expanded(child: SizedBox.shrink()),
          AppButton(
            buttonText: context.l10n.cartConfirmation,
            onTap: () {},
            color: AppColors.secondary,
            textColor: AppColors.quaterniary,
          ).paddingOnly(right: 10),
        ],
      ),
    );
  }
}
