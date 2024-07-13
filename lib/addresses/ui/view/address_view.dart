import 'package:flutter/material.dart';
import 'package:app_ui/app_ui.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.quaterniary,
      appBar: AppBar(
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Text(
              '0/4',
            ),
          ),
        ],
        title: const Text(
          'My address',
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
