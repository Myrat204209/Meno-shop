import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:meno_shop/cart/cart.dart';
import 'package:meno_shop/l10n/l10n.dart';

class CartAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CartAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        context.l10n.cart,
      ),
      actions: [
        TextButton(
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return SizedBox(
                    width: double.infinity,
                    height: 240,
                    child: Column(
                      children: [
                        Align(
                          alignment: AlignmentDirectional.topEnd,
                          child: IconButton(
                              onPressed: () => context.pop(),
                              highlightColor: AppColors.transparent,
                              splashColor: AppColors.transparent,
                              hoverColor: AppColors.transparent,
                              icon: const Icon(Icons.cancel_outlined)),
                        ),
                        Text(
                          context.l10n.cartClearTitle,
                          style: const AppTextStyle.text().lg().bold(),
                        ),
                        Text(context.l10n.cartClearContent)
                            .paddingSymmetric(vertical: 20),
                        Row(
                          children: [
                            AppButton(
                              buttonText: context.l10n.neglection,
                              onTap: () => context.pop(),
                              color: const Color.fromARGB(127, 223, 229, 236),
                              textColor: AppColors.secondary,
                            ).paddingSymmetric(horizontal: 35),
                            AppButton(
                              buttonText: context.l10n.affirmation,
                              onTap: () {
                                context
                                    .read<CartBloc>()
                                    .add(CartClearRequested());
                                context.pop();
                              },
                              color: AppColors.secondary,
                              textColor: AppColors.quaterniary,
                            )
                          ],
                        )
                      ],
                    ).paddingSymmetric(horizontal: 20, vertical: 10),
                  );
                });
          },
          child: Text(
            context.l10n.cartClearTitle,
            style: const AppTextStyle.text()
                .regular()
                .withColor(AppColors.secondary),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 80);
}
