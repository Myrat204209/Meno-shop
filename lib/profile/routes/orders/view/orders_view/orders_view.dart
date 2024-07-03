// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:meno_shop/profile/profile.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Orders",
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 20),
            const OrderCollectionColumn(
              orderState: OrderStates.expected,
            ),
            Divider(
              indent: 15,
              endIndent: 15,
              color: AppColors.neutral.shade500,
            ),
            const OrderCollectionColumn(
              orderState: OrderStates.accepted,
            ),
            Divider(
              indent: 15,
              endIndent: 15,
              color: AppColors.neutral.shade500,
            ),
            const OrderCollectionColumn(
              orderState: OrderStates.cancelled,
            ),
            Divider(
              indent: 15,
              endIndent: 15,
              color: AppColors.neutral.shade500,
            ),
          ],
        ),
      ),
      backgroundColor: AppColors.quaterniary,
    );
  }
}

enum OrderStates {
  expected(AppColors.starsColor),
  accepted(AppColors.accepted),
  cancelled(AppColors.secondary);

  final Color orderColor;

  const OrderStates(this.orderColor);
}

class OrderCollectionColumn extends StatelessWidget {
  const OrderCollectionColumn({
    super.key,
    required this.orderState,
  });
  final OrderStates orderState;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const OrderInformationPage(),
        ));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Stack(
                  children: [
                    Icon(
                      Icons.access_alarm,
                      size: 50,
                    ),
                    Positioned(
                      left: 15,
                      top: 0,
                      right: 15,
                      bottom: 0,
                      child: Icon(
                        Icons.access_time_filled_sharp,
                        color: AppColors.secondary,
                        size: 50,
                      ),
                    ),
                    Positioned(
                      top: 0,
                      left: 30,
                      right: 30,
                      child: Icon(
                        size: 50,
                        color: AppColors.secondary,
                        Icons.access_time_sharp,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  width: 35,
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '13:38',
                    ),
                    Text(
                      '23.12.2020',
                    ),
                  ],
                ),
                const Expanded(child: SizedBox()),
                Row(
                  children: [
                    const Text(
                      '3678 TMT',
                    ),
                    IconButton(
                        splashColor: AppColors.secondary,
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_forward))
                  ],
                )
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const SizedBox(width: 10),
                Icon(
                  Icons.expand_circle_down,
                  color: orderState.orderColor,
                ),
                const SizedBox(width: 10),
                Text(
                  '${orderState.name} -  WU18084888',
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
