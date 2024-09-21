// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:app_ui/app_ui.dart';
import 'package:data_provider/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:meno_shop/l10n/l10n.dart';

class ProductAdvantagesList extends StatelessWidget {
  const ProductAdvantagesList({
    super.key,
    required this.advantages,
  });

  final AdvantagesItem advantages;

  @override
  Widget build(BuildContext context) {
    final locale = context.l10n.localeName;
    final advantagesList = (advantages.toJson())
        .entries
        .where((entry) =>
            !entry.key.toLowerCase().contains('one') && entry.value == true)
        .map((entry) => entry.key)
        .toList();
    if (advantages.advantageProduct != 0) {
      advantagesList.add('advantage${advantages.advantageProduct}');
    }
    if (advantagesList.isNotEmpty) {
      return SizedBox(
        height: 55,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: advantagesList.length,
          itemBuilder: (context, index) {
            final advantageName = advantagesList[index];
            return SvgPicture.asset(
              advantageName.extendAdvantages(locale: locale),
              width: 38,
              // height: 60,
              fit: BoxFit.cover,
            ).clipper(5).paddingOnly(left: 5);
          },
          // shrinkWrap: true,
          padding: EdgeInsets.zero,
        ),
      ).paddingOnly(top: 10);
    }

    return const SizedBox.shrink();
  }
}

class AdvantageCircle extends StatelessWidget {
  const AdvantageCircle({
    super.key,
    required this.advantages,
  });

  final AdvantagesItem advantages;

  @override
  Widget build(BuildContext context) {
    final locale = context.l10n.localeName;
    final advantagesList = (advantages.toJson())
        .entries
        .where((entry) =>
            entry.key.toLowerCase().contains('one') && entry.value == true)
        .map((entry) => entry.key)
        .toList();
    if (advantagesList.isNotEmpty) {
      return SizedBox(
        height: 55,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: advantagesList.length,
          itemBuilder: (context, index) {
            final advantageName = advantagesList[index];
            return SvgPicture.asset(
              advantageName.extendAdvantages(locale: locale),
              width: 55,
              // height: 60,
              fit: BoxFit.cover,
            ).paddingOnly(right: 5);
          },
          padding: EdgeInsets.zero,
        ),
      );
    }

    return const SizedBox.shrink();
  }
}
