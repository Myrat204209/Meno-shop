import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:meno_shop/l10n/l10n.dart';

class CheckoutContent extends StatelessWidget {
  const CheckoutContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          
          // AppRadioButton(
          //   text: context.l10n.paymentMethod,
          //   values: [
          //     context.l10n.paymentMethodCash,
          //     context.l10n.paymentMethodTerminal,
          //   ],
          // ),
          // AppRadioButton(
          //   text: context.l10n.deliveryTime,
          //   values: const [
          //     '09:00 - 13:00',
          //     '13:00 - 17:00',
          //     '17:00 - 21:00',
          //   ],
          // ),
        ],
      ),
    );
  }
}
