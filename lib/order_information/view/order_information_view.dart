// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:meno_shop/l10n/l10n.dart';

class OrderInformationView extends StatelessWidget {
  const OrderInformationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.quaterniary,
      appBar: AppBar(
        title: Text(context.l10n.orderInformation),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            const Divider(
              color: AppColors.primary,
              thickness: 0,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(Icons.arrow_downward),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(context.l10n.totalPrice),
                    const Text('3678 TMT'),
                  ],
                ),
                const Expanded(child: SizedBox.shrink()),
                AppButton(
                  buttonText: 'Buy Again',
                  onTap: () {},
                  textColor: AppColors.quaterniary,
                  color: AppColors.secondary,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
