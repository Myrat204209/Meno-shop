// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:app_ui/app_ui.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:data_provider/data_provider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:meno_shop/banner/banner.dart';
import 'package:meno_shop/main/main.dart';

class HomePageBannerCard extends StatelessWidget {
  const HomePageBannerCard({
    super.key,
    required this.banners,
  });
  final List<BannerItem> banners;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: BlocBuilder<BannerCubit, int>(
          builder: (context, state) {
            final selectedBanner =
                context.select((BannerCubit cubit) => cubit.state);

            return Stack(
              alignment: Alignment.center,
              children: [
                CarouselSlider.builder(
                  itemCount: 5,
                  itemBuilder: (context, index, realIndex) {
                    // var banner = banners[index];
                    return AppBannerCard(
                      bannerType: BannerType.poster,
                      imageUrl: '$kDefaultBaseUrl\\${'banner.photo'}',
                      label: 'banner.label',
                      title: 'banner.title',
                      subtitle: 'banner.subtitle',
                      onPressed: () {},
                    );
                  },
                  options: CarouselOptions(
                    autoPlay: true,
                    enlargeCenterPage: true,
                    viewportFraction: 1,
                    initialPage: 0,
                    onPageChanged: (index, reason) {
                      context.read<BannerCubit>().setTab(index);
                    },
                  ),
                ),
                Positioned(
                  bottom: 5,
                  child: DotsIndicator(
                    dotsCount: 5,
                    position: selectedBanner,
                    decorator: DotsDecorator(
                      size: const Size(7, 7),
                      color: AppColors.neutral.shade300,
                      activeColor: AppColors.secondary,
                      spacing: const EdgeInsets.only(right: 5),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
