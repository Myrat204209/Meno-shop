import 'package:app_ui/app_ui.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:meno_shop/home/home.dart';

class HomePageBannerCard extends StatefulWidget {
  const HomePageBannerCard({
    super.key,
  });

  @override
  State<HomePageBannerCard> createState() => _HomePageBannerCardState();
}

class _HomePageBannerCardState extends State<HomePageBannerCard> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      // key: const Key('Banner Card'),
      child: Stack(
        alignment: Alignment.center,
        children: [
          CarouselSlider.builder(
            itemCount: 5,
            itemBuilder: (context, index, realIndex) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: AppBannerCard(
                imageLink: 'assets/${images[index]}',
                title: 'FROM ONLINE STORE',
                subtitle: 'MEN\'S LIFESTYLE COLLECTION',
                label: '',
                onButtonPressed: () {},
              ),
            ),
            options: CarouselOptions(
              padEnds: false,
              // height: 275,
              enlargeCenterPage: true,
              viewportFraction: 1,
              initialPage: 0,
              onPageChanged: (index, reason) => setState(() {
                _currentIndex = index;
              }),
            ),
          ),
          Positioned(
            bottom: 15,
            child: DotsIndicator(
              dotsCount: 5,
              position: _currentIndex.toInt(),
              decorator: DotsDecorator(
                color: UIColors.neutral.shade300,
                activeColor: UIColors.secondary,
                spacing: const EdgeInsets.only(right: 5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
