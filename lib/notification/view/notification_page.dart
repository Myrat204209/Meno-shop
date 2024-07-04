import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Notification',
        ),
      ),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return AppCard(
            title: Text(
              'AS475912',
              style: const AppTextStyle.text().headline6().semiBold(),
            ),
            subtitle: Text(
              'WU881911 - 21.02.2023 / 13:21 \nYou can see the complete details in your profile',
              softWrap: true,
              style: const AppTextStyle.text().subtitle1().regular(),
            ),
            trailing: Text(
              'NEW!',
              style: const AppTextStyle.text()
                  .bodyText1()
                  .medium()
                  .withColor(AppColors.newMessage),
            ),
          );
        },
      ).paddingOnly(top: 10),
    );
  }
}
