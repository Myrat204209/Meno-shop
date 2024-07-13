// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const AppSearchBar(),
          scrolledUnderElevation: 0,
          backgroundColor: AppColors.quaterniary,
          actions: [
            AppActionsButton(
              icon: Icons.language,
              onPressed: () {},
              //onPressed: () => showLanguageSelectBottomSheet(context: context),
              backgroundColor: AppColors.neutral.shade200,
            ),
            AppActionsButton(
              icon: Icons.notifications_none,
              onPressed: () {
                // Navigator.of(context).push(MaterialPageRoute(
                // builder: (context) => const NotificationsPage(),

                //));
              },
            ),
          ],
        ),
        body: const Padding(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Column(children: [
              CategoriesView(),
            ])),
      ),
    );
  }
}

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          buildExpansionTile(context, 'For Women T-shirt',
              ['Subcategory 1.1', 'Subcategory 1.2']),
          buildExpansionTile(
              context, 'Women Bag', ['Subcategory 2.1', 'Subcategory 2.2']),
          buildExpansionTile(
              context, 'Watch', ['Subcategory 3.1', 'Subcategory 3.2']),
          buildExpansionTile(context, 'Plumbing', ['Copper', 'Flexi']),
          buildExpansionTile(context, 'Materials for women',
              ['Subcategory 2.1', 'Subcategory 2.2']),
        ],
      ),
    );
  }

  Widget buildExpansionTile(
      BuildContext context, String title, List<String> subcategories) {
    return Card(
      elevation: 0,
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
      child: ExpansionTile(
        collapsedShape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: AppColors.neutral.shade50)),
        shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: AppColors.neutral.shade50)),
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        leading: const Icon(
          Icons.plumbing,
          color: AppColors.secondary,
        ),
        title: Text(
          title,
          style: const AppTextStyle.text()
              .regular()
              .md()
              .withColor(const Color(0xFF221122)),
        ),
        children: subcategories.map((subcategory) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: ListTile(
              title: Text(subcategory),
              shape: ContinuousRectangleBorder(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                side: BorderSide(width: 0.5, color: AppColors.neutral.shade50),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
