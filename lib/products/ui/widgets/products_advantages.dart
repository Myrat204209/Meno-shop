import 'dart:developer';

import 'package:app_ui/app_ui.dart';
import 'package:data_provider/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:meno_shop/l10n/l10n.dart';

class ProductAdvantagesList extends StatelessWidget {
  const ProductAdvantagesList({
    super.key,
    required this.advantages,
  });

  final AdvantagesItem? advantages;

  @override
  Widget build(BuildContext context) {
    final locale = context.l10n.localeName;
    final advantagesJson = advantages?.toJson();
    final advantagesList = advantagesJson?.keys
        .where((key) => advantagesJson[key] == true)
        .toList();

    if (advantagesList != null && advantagesList.isNotEmpty) {
      log('--------------This product has advantages : $advantagesList');
      return Expanded(
        child: ListView(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          children: [
            AdvantageSquareSticker(
                    locale: locale, advantagesList: advantagesList)
                .paddingOnly(
              left: 5,
            ),
          ],
        ),
      );
    }

    return const SizedBox();
  }
}

class AdvantageSquareSticker extends StatelessWidget {
  const AdvantageSquareSticker({
    super.key,
    required this.locale,
    required this.advantagesList,
  });

  final String locale;
  final List<String>? advantagesList;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: const SizedBox(
        height: 46,
        width: 35,
        // child: (kAdvantagesJsonBody[locale][advantagesList[index]]
        //         as SvgGenImage)
        //     .svg(fit: BoxFit.cover),
        // Placeholder for advantage icons based on locale and advantage type
        // child: ((kAdvantagesJsonBody['tk'][advantagesList[index]] != null)
        //         as SvgGenImage)
        //     .svg(fit: BoxFit.cover),
      ),
    );
  }
}

class ProductAdvantageSticker extends StatelessWidget {
  const ProductAdvantageSticker({
    super.key,
    required this.locale,
    required this.advantageNumber,
  });

  final String locale;
  final String advantageNumber;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 5,
      top: 5,
      child: (kAdvantagesJsonBody[locale]['advantageProduct'][advantageNumber]
              as SvgGenImage)
          .svg(fit: BoxFit.cover),
    );
  }
}