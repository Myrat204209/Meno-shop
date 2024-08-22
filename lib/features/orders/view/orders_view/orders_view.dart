// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      //TODO: Replace with actual orders count
      itemCount: 3,
      itemBuilder: (context, index) => index < 2
          ? ListTile(
              title: Text(
                '13:38',
                style: const AppTextStyle.text().sm(),
              ),
              subtitle: const Text('23.12.2020').paddingOnly(top: 5),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '3678 TMT',
                    style: const AppTextStyle.text().semiBold(),
                  ),
                  IconButton.filled(
                    splashRadius: 10,
                    color: Colors.red,
                    focusColor: Colors.blue,
                    hoverColor: Colors.black,
                    highlightColor: Colors.pink,
                    splashColor: Colors.yellow,
                    constraints:
                        const BoxConstraints.tightFor(height: 30, width: 30),
                    padding: const EdgeInsets.only(left: 2),
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_forward_ios_sharp),
                  ),
                ],
              ),
            )
          : const SizedBox(),
      separatorBuilder: (context, index) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: const Icon(
              Icons.access_time_filled,
              color: Colors.orange,
            ),
            dense: true,
            visualDensity: VisualDensity.compact,
            title: Text(
              'Expected - W109JISFD1',
              style: const AppTextStyle.text().medium().sm(),
            ),
          ),
          Divider(
            color: AppColors.neutral.shade400,
            indent: 10,
            endIndent: 10,
          ),
        ],
      ),
    ).paddingSymmetric(horizontal: 5);
  }
}
