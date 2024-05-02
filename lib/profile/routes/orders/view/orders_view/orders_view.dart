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
        title: Text(
          "Orders",
          style: UITextStyle.headline5.copyWith(
            color: UIColors.primary,
          ),
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
              color: UIColors.neutral.shade500,
            ),
            const OrderCollectionColumn(
              orderState: OrderStates.accepted,
            ),
            Divider(
              indent: 15,
              endIndent: 15,
              color: UIColors.neutral.shade500,
            ),
            const OrderCollectionColumn(
              orderState: OrderStates.cancelled,
            ),
            Divider(
              indent: 15,
              endIndent: 15,
              color: UIColors.neutral.shade500,
            ),
          ],
        ),
      ),
      backgroundColor: UIColors.quaterniary,
    );
  }
}

enum OrderStates {
  expected(UIColors.starsColor),
  accepted(UIColors.accepted),
  cancelled(UIColors.secondary);

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
                        color: UIColors.secondary,
                        size: 50,
                      ),
                    ),
                    Positioned(
                      top: 0,
                      left: 30,
                      right: 30,
                      child: Icon(
                        size: 50,
                        color: UIColors.secondary,
                        Icons.access_time_sharp,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  width: 35,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '13:38',
                      style: UITextStyle.subtitle2.copyWith(
                        color: UIColors.primary,
                      ),
                    ),
                    Text(
                      '23.12.2020',
                      style: UITextStyle.subtitle2.copyWith(
                        color: UIColors.primary,
                      ),
                    ),
                  ],
                ),
                const Expanded(child: SizedBox()),
                Row(
                  children: [
                    Text(
                      '3678 TMT',
                      style: UITextStyle.headline6
                          .copyWith(color: UIColors.primary),
                    ),
                    IconButton(
                        splashColor: UIColors.secondary,
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
                  '${orderState.name.capitalize()} -  WU18084888',
                  style:
                      UITextStyle.subtitle2.copyWith(color: UIColors.primary),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
