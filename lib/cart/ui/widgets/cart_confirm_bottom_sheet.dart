import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meno_shop/l10n/l10n.dart';

final kCheckoutDescriptionStyle = const AppTextStyle.text().md().regular();
final kCheckoutPriceStyle = const AppTextStyle.text().md().medium();
final kCheckoutTotalTextStyle = const AppTextStyle.text().md().semiBold();

class CartConfirmBottomSheetContent extends StatelessWidget {
  const CartConfirmBottomSheetContent({
    super.key,
    required this.onBottomRowTap,
    required this.onButtonPressed,
    required this.totalPrice,
    required this.buttonText,
  });
  final VoidCallback onBottomRowTap;
  final VoidCallback onButtonPressed;
  final double totalPrice;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return SizedBox(
      width: double.infinity,
      height: 250,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${l10n.totalCost}: ",
                style: kCheckoutDescriptionStyle,
              ),
              Text(
                "$totalPrice TMT",
                style: kCheckoutPriceStyle,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("${l10n.deliverySerice}: ",
                  style: kCheckoutDescriptionStyle),
              Text("20 TMT", style: kCheckoutPriceStyle),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("${l10n.discount}: ", style: kCheckoutDescriptionStyle),
              Text("-0 TMT", style: kCheckoutPriceStyle),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("${l10n.totalPrice}: ", style: kCheckoutTotalTextStyle),
              Text("${totalPrice - 20} TMT", style: kCheckoutTotalTextStyle),
            ],
          ),
          Divider(color: AppColors.neutral.shade300),
          ConfirmCart(
            onBottomRowTap: onBottomRowTap,
            totalPrice: totalPrice,
            buttonText: buttonText,
            onButtonPressed: onButtonPressed,
          )
        ],
      ),
    );
  }
}

class ConfirmCart extends StatelessWidget {
  const ConfirmCart({
    super.key,
    required this.onBottomRowTap,
    required this.totalPrice,
    required this.buttonText,
    required this.onButtonPressed,
  });

  final VoidCallback onBottomRowTap;
  final double totalPrice;
  final String buttonText;
  final VoidCallback onButtonPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onBottomRowTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.l10n.totalPrice,
                style: kCheckoutTotalTextStyle,
              ),
              Text(
                '${totalPrice - 20} TMT',
                style: kCheckoutTotalTextStyle,
              ),
            ],
          ),
          const Expanded(child: SizedBox.shrink()),
          AppButton(
            buttonText: buttonText,
            onTap: onButtonPressed,
            color: AppColors.secondary,
            textColor: AppColors.quaterniary,
          )
        ],
      ).paddingSymmetric(horizontal: 20),
    );
  }
}
