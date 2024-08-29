import 'package:flutter/material.dart';
import 'package:meno_shop/l10n/l10n.dart';
import 'package:meno_shop/profile/view/view.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.profile),
        elevation: 0,
      ),
      body: const ProfileView(),
    );
  }
}
