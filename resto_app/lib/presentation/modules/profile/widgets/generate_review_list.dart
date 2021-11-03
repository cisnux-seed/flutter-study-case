import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/data/models/model_customer_review.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'card_review.dart';

class GenerateListReview extends StatelessWidget {
  const GenerateListReview({
    required this.customerReviews,
  });

  final List<CustomerReviews> customerReviews;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.35,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) => CardReview(
          customerReview: customerReviews[index],
        ),
        separatorBuilder: (_, index) => SizedBox(
          width: 10.w,
        ),
        itemCount: customerReviews.length,
      ),
    );
  }
}
