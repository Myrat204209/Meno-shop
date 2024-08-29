import 'package:flutter/material.dart';

class CheckoutContent extends StatelessWidget {
  const CheckoutContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
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
