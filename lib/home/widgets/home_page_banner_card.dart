import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class HomePageBannerCard extends StatelessWidget {
  const HomePageBannerCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      // key: const Key('Banner Card'),
      child: AppBannerCard(
        imageLink: 'assets/jeans.jpg',
        title: 'FROM ONLINE STORE',
        subtitle: 'MEN\'S LIFESTYLE COLLECTION',
        content: '',
        onButtonPressed: () {},
      ),
    );
  }
}
