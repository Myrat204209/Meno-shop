import 'package:flutter/material.dart';
import 'package:app_ui/app_ui.dart';

class MyAddressView extends StatelessWidget {
  const MyAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColors.quaterniary,
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text(
              '0/4',
              style: UITextStyle.subtitle1.copyWith(
                color: UIColors.neutral.shade500,
              ),
            ),
          ),
        ],
        title: Text(
          'My address',
          style: UITextStyle.headline5.copyWith(
            color: UIColors.primary,
          ),
        ),
        centerTitle: true,
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: 260,
          crossAxisCount: 2,
        ),
        children: const [],
      ),
    );
  }
}
