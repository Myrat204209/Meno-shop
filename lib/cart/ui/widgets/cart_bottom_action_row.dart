import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meno_shop/cart/cart.dart';
import 'package:meno_shop/l10n/l10n.dart';

class CartBottomActionRow extends StatelessWidget {
  const CartBottomActionRow({
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
    return AppButton(
      buttonText: l10n.submit,
      onTap: () {
        showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return SizedBox(
                width: double.infinity,
                height: 250,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          l10n.price,
                          style: const AppTextStyle.text().semiBold().xl(),
                        ),
                        IconButton(
                          onPressed: () => context.pop(),
                          icon: const Icon(Icons.cancel).paddingOnly(right: 30),
                        )
                      ],
                    ).paddingOnly(top: 20, bottom: 18),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("${l10n.totalCost}: ",
                            style: const AppTextStyle.text().md()),
                        Text("3880 TMT", style: const AppTextStyle.text().md()),
                      ],
                    ).paddingSymmetric(horizontal: 25),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Text("${l10n.deliverySerice}: ",
                    //         style: const AppTextStyle.text().regular()),
                    //     const Text("20 TMT", style: AppTextStyle.text()),
                    //   ],
                    // ).paddingSymmetric(horizontal: 25, vertical: 7),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("${l10n.discount}: ",
                            style: const AppTextStyle.text().md()),
                        Text("-50 TMT", style: const AppTextStyle.text().md()),
                      ],
                    ).paddingSymmetric(horizontal: 25),
                    Divider(color: AppColors.neutral.shade300)
                        .paddingSymmetric(vertical: 2),
                    ConfirmCart(
                      onBottomRowTap: onBottomRowTap,
                      totalPrice: totalPrice,
                      buttonText: buttonText,
                      onButtonPressed: onButtonPressed,
                    )
                  ],
                ),
              );
            });
      },
      color: AppColors.secondary,
      textColor: AppColors.quaterniary,
    ).paddingSymmetric(horizontal: 15);
  }
}
