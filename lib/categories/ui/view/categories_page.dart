// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:meno_shop/categories/categories.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  // int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CategoryPageAppBar(),
      body: Row(
        children: [
          SizedBox(width: 15),
          Expanded(
            flex: 7,
            child: CategoryPageGridView(),
          ),
        ],
      ),
    );
  }
}

// class TwoScrollableColumn extends StatelessWidget {
//   const TwoScrollableColumn({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.max,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Expanded(
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               Expanded(
//                 child: SizedBox(
//                   height: 600,
//                   child: AppCategoryListView(
//                     images: images,
//                     scrollDirection: Axis.vertical,
//                   ),
//                 ),
//               ),
//               const Flexible(
//                 flex: 3,
//                 child: CategoryPageGridVIew(),
//               )
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }


/**
 * 
 */