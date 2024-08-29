import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
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
    return AppButton(
      buttonText: 'Submit',
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
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          context.l10n.productPrice,
                          style: const AppTextStyle.text().semiBold().xl(),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          highlightColor: AppColors.transparent,
                          splashColor: AppColors.transparent,
                          hoverColor: AppColors.transparent,
                          icon: const Icon(Icons.cancel_outlined)
                              .paddingOnly(left: 110, right: 30),
                        )
                      ],
                    ).paddingOnly(top: 20, bottom: 18),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("${context.l10n.totalCost}: ",
                            style: const AppTextStyle.text().md()),
                        Text("3880 TMT", style: const AppTextStyle.text().md()),
                      ],
                    ).paddingSymmetric(horizontal: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("${context.l10n.deliverySerice}: ",
                            style: const AppTextStyle.text().regular()),
                        const Text("20 TMT", style: AppTextStyle.text()),
                      ],
                    ).paddingSymmetric(horizontal: 25, vertical: 7),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("${context.l10n.discount}: ",
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
