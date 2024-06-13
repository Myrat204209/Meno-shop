import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:meno_shop/profile/view/view.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.quaterniary,
          title: const Padding(
            padding: EdgeInsets.only(top: 30),
            child: Text(
              'My Profile',
            ),
          ),
        ),
        body: const ProfileView(),
      ),
    );
  }
}
