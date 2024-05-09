import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: UIColors.quaterniary,
        centerTitle: true,
        title: Text(
          'Notification',
          style: UITextStyle.headline5.copyWith(
            color: UIColors.primary,
          ),
        ),
      ),
      backgroundColor: UIColors.quaterniary,
      body: ListView.builder(
        itemCount: 3,
        // padding: EdgeInsets.only(bottom: ),
        itemBuilder: (context, index) {
          const String notRead = '🔴';
          return SizedBox(
            height: 112,
            width: 360,
            child: AppBorderColorBox(
              borderColor: UIColors.neutral.shade300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    index < 2 ? '$notRead  WU88191111' : 'WU88191111',
                    style: UITextStyle.headline5.copyWith(
                      color: UIColors.primary,
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    'WU881911 - 21.02.2023 / 13:21 was accepted on You can see the complete details in your profile',
                    style: UITextStyle.subtitle2.copyWith(
                      color: UIColors.primary,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
