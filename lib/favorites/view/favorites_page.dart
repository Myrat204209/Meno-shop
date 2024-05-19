// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

const List<String> categoryChipList = [
  'Accessories',
  'Shoes',
  'PC',
  'Kids',
  'Jewelry',
  'Camera',
];
const List<String> sizeChipList = [
  'S',
  'M',
  'L',
  'XL',
  '2XL',
  '39',
  '40',
  '41',
  '43'
];
const List<String> brandChipList = ['Dell', 'HP', 'Nike', 'Adidas'];

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            const FilterPageWrap(
              label: '',
              children: [],
            ),
            const FilterPageWrap(
              children: categoryChipList,
              label: 'Categories',
            ),
            const FilterPageWrap(children: sizeChipList, label: 'Size'),
            const FilterPageWrap(children: brandChipList, label: 'Brands'),
            const Expanded(child: SizedBox()),
            AppButton(
              type: AppButtonType.large,
              text: 'Close',
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}

class FilterPageWrap extends StatelessWidget {
  const FilterPageWrap({
    super.key,
    this.children,
    required this.label,
  });
  final List<String?>? children;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTitledWithViewAllRow(title: label),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: children == null
              ? []
              : children!
                  .map((element) => FilterPageChip(
                        isSelected: false,
                        label: element,
                      ))
                  .toList(),
        ),
        const Divider(),
        const SizedBox(height: 20),
      ],
    );
  }
}

class FilterPageChip extends StatelessWidget {
  const FilterPageChip({
    super.key,
    required this.isSelected,
    required this.label,
  });
  final bool isSelected;
  final String? label;
  @override
  Widget build(BuildContext context) {
    return FilterChip(
      color: MaterialStatePropertyAll(UIColors.neutral.shade300),
      label: Text(
        label ?? '',
        style: UITextStyle.subtitle2
            .copyWith(color: UIColors.primary, fontSize: 13),
      ),
      selected: isSelected,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(10),
      ),
      onSelected: (bool value) {},
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }
}
