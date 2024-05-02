// import 'package:app_ui/app_ui.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import '../../product.dart';

// // import 'product_details.dart';

// class ProductDetailsView extends StatelessWidget {
//   const ProductDetailsView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(
//         top: 10.h,
//         left: 16.w,
//         right: 16.w,
//       ),
//       child: Stack(
//         children: [
//           SingleChildScrollView(
//             child: SizedBox(
//               height: MediaQuery.of(context).size.height,
//               width: MediaQuery.of(context).size.width,
//               child: const Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 // mainAxisSize: MainAxisSize.min,
//                 children: [
//                   ProductDetailsImageSlider(),
//                   SizedBox(height: 10),
//                   ProductDetailsLabelText(),
//                   SizedBox(height: 20),
//                   ProductDetailRichText(),
//                   SizedBox(height: 15),
//                   ProductDetailsRow(),
//                   SizedBox(height: 15),
//                   // AppRatingStarsWidget(),
//                   ProductDetailsRatingStarRow(),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   ProductDetailsDescriptionText(),

//                   // LayoutBuilder(
//                   //   builder: (context, constraints) => GridView.builder(
//                   //     itemCount: 2,
//                   //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   //       mainAxisExtent: constraints.maxHeight,
//                   //       crossAxisCount: 2,
//                   //     ),
//                   //     itemBuilder: (context, index) {
//                   //       return const AppProduct(
//                   //         price: 30,
//                   //         label: 'asdas',
//                   //         category: 'asas',
//                   //       );
//                   //     },
//                   //   ),
//                   // )
//                 ],
//               ),
//             ),
//           ),
//           Positioned(
//             bottom: 100,
//             right: 20,
//             child: AppButton(
//               type: AppButtonType.large,
//               text: 'Assessment',
//               onTap: () {},
//             ),
//           ),
//           Positioned(
//             bottom: 20,
//             left: 0,
//             child: Container(
//               height: 50,
//               width: 150,
//               decoration: BoxDecoration(
//                 border: Border.all(
//                   color: AppColors.neutral.shade300,
//                 ),
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   Icon(
//                     Icons.remove,
//                     size: 30,
//                     color: AppColors.primary,
//                   ),
//                   Text(
//                     '1',
//                     style: UITextStyle.headline5.copyWith(
//                       color: AppColors.primary,
//                     ),
//                   ),
//                   Icon(
//                     Icons.add,
//                     size: 30,
//                     color: AppColors.primary,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Positioned(
//             bottom: 20,
//             right: 0,
//             child: AppButton(
//               type: AppButtonType.iconed,
//               text: 'Add to Cart',
//               onTap: () {},
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

