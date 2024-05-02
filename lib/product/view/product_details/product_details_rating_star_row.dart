// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ProductDetailsRatingStarRow extends StatefulWidget {
  const ProductDetailsRatingStarRow({
    super.key,
    required this.initialRating,
  });
  final double initialRating;

  @override
  _ProductDetailsRatingStarRowState createState() =>
      _ProductDetailsRatingStarRowState();
}

class _ProductDetailsRatingStarRowState
    extends State<ProductDetailsRatingStarRow> {
  late double currentRating;

  @override
  void initState() {
    super.initState();
    currentRating = widget.initialRating;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RatingBar(
          initialRating: currentRating,
          minRating: 0,
          maxRating: 5,
          allowHalfRating: false,
          itemSize: 30,
          ratingWidget: RatingWidget(
            full: const Icon(
              Icons.star,
              color: UIColors.starsColor,
            ),
            half: const SizedBox.shrink(),
            empty: Icon(
              Icons.star_border,
              color: UIColors.neutral.shade500,
            ),
          ),
          onRatingUpdate: (rating) {
            setState(() {
              currentRating = rating;
            });
          },
        ),
        const Gap(15),
        Text(
          '212 revievs',
          style: UITextStyle.headline5.copyWith(
            color: UIColors.primary,
            fontSize: 16.sp,
          ),
        )
      ],
    );
  }
}
    // return Row(
    //   children: [
    //     SizedBox(
    //       height: 35,
    //       width: 150,
    //       child: ListView.builder(
    //         itemCount: 5,
    //         itemExtent: 25,
    //         scrollDirection: Axis.horizontal,
    //         itemBuilder: (context, index) => InkWell(
    //           onTap: () {},
    //           borderRadius: BorderRadius.circular(10),
    //           child: const Icon(
    //             Icons.star,
    //             size: 25,
    //             color: AppColors.starsColor,
    //           ),
    //         ),
    //       ),
    //     ),

    //   ],
    // );