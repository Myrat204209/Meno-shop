import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppRadioButton(
            text: 'Types of payment',
            values: [
              'Cash',
              'Credit Card',
            ],
          ),
          AppRadioButton(
            text: 'Select when to deliver',
            values: [
              '09:00 - 13:00',
              '13:00 - 17:00',
              '17:00 - 21:00',
            ],
          ),
        ],
      ),
    );
  }
}
