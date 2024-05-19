import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

const List<String> categoryChipList = [
  'Accessories',
  'Shoes',
  'PC',
  'Camera',
  'Kids',
  'Jewelry'
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
            const AppTitledWithViewAllRow(title: 'Categories'),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: categoryChipList
                  .map(
                    (element) => ActionChip(
                      color:
                          MaterialStatePropertyAll(UIColors.neutral.shade300),
                      onPressed: () {},
                      label: Text(
                        element,
                        style: UITextStyle.subtitle1
                            .copyWith(color: UIColors.primary),
                      ),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  )
                  .toList(),
            ),
            const Divider(),
            const SizedBox(
              height: 20,
            ),
            const AppTitledWithViewAllRow(title: 'Size'),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: sizeChipList
                  .map(
                    (element) => ActionChip(
                      color:
                          MaterialStatePropertyAll(UIColors.neutral.shade300),
                      onPressed: () {},
                      label: Text(
                        element,
                        style: UITextStyle.subtitle1
                            .copyWith(color: UIColors.primary),
                      ),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  )
                  .toList(),
            ),
            const Divider(),
            const SizedBox(
              height: 20,
            ),
            const AppTitledWithViewAllRow(title: 'Brand'),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: brandChipList
                  .map(
                    (element) => ActionChip(
                      color:
                          MaterialStatePropertyAll(UIColors.neutral.shade300),
                      onPressed: () {},
                      label: Text(
                        element,
                        style: UITextStyle.subtitle1
                            .copyWith(color: UIColors.primary),
                      ),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  )
                  .toList(),
            ),
            const Expanded(
              child: SizedBox(),
            ),
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
