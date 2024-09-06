// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:developer';

import 'package:app_ui/app_ui.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:data_provider/data_provider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:meno_shop/banner/banner.dart';
import 'package:meno_shop/constants/constants.dart';
import 'package:meno_shop/l10n/l10n.dart';
import 'package:url_launcher/url_launcher.dart';

// final Uri _url = Uri.parse('https://flutter.dev');

class HomePageBannerCard extends StatelessWidget {
  const HomePageBannerCard({
    super.key,
    required this.banners,
  });
  final List<BannerItem> banners;
  @override
  Widget build(BuildContext context) {
    final locale = context.l10n.localeName;
    return SliverToBoxAdapter(
      child: BlocBuilder<BannerCubit, int>(
        builder: (context, state) {
          final selectedBanner =
              context.select((BannerCubit cubit) => cubit.state);

          return Stack(
            alignment: Alignment.topLeft,
            children: [
              if (banners.isNotEmpty)
                CarouselSlider.builder(
                  itemCount: banners.length,
                  itemBuilder: (context, index, realIndex) {
                    final banner = banners[index];

                    return BannerCard(
                      bannerType: banner.bannerType!,
                      imageUrl: banner.photo != null
                          ? banner.photo!.path!.fullPath()
                          : 'null',
                      label: banner.label!.changeLocale(locale),
                      title: banner.title!.changeLocale(locale),
                      subtitle: banner.subtitle!.changeLocale(locale),
                      onPressed: () {
                        final Uri url = Uri.parse(banner.path!);
                        if (banner.bannerType == 'ad') {
                          _launchUrl(url);
                        } else if (banner.bannerType == 'local') {
                          log('------------We need to navigate to the given location');
                        }
                      },
                      buttonText: context.l10n.startShopping,
                    );
                  },
                  options: CarouselOptions(
                    autoPlay: true,
                    enlargeCenterPage: false,
                    viewportFraction: 0.95,
                    initialPage: 0,
                    onPageChanged: (index, reason) {
                      context.read<BannerCubit>().setTab(index);
                    },
                  ),
                ),
              if (banners.isNotEmpty)
                BannerDotsCounter(
                  dotsCount: banners.length,
                  selectedBanner: selectedBanner,
                )
            ],
          );
        },
      ).paddingOnly(bottom: 15),
    );
  }

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}

class BannerDotsCounter extends StatelessWidget {
  const BannerDotsCounter({
    super.key,
    required this.dotsCount,
    required this.selectedBanner,
  });

  final int dotsCount;
  final int selectedBanner;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 15,
      left: MediaQuery.sizeOf(context).width / 2 - dotsCount * 7,
      child: DotsIndicator(
        dotsCount: dotsCount,
        position: selectedBanner,
        decorator: DotsDecorator(
          size: const Size(8, 8),
          color: AppColors.neutral.shade300,
          activeColor: AppColors.secondary,
          spacing: const EdgeInsets.only(right: 5),
        ),
      ),
    );
  }
}
