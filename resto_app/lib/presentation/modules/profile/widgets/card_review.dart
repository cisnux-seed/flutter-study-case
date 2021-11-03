import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:resto_app/data/models/model_customer_review.dart';

class CardReview extends StatelessWidget {
  const CardReview({
    required this.customerReview,
  });

  final CustomerReviews customerReview;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(
        4.0,
        16.0,
        4.0,
        4.0,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      width: context.width * 0.45,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: context.height * 0.055,
            width: context.width * 0.25,
            child: CircleAvatar(
              backgroundColor: context.theme.colorScheme.secondary,
              child: Text(
                customerReview.name[0].toUpperCase(),
                style: context.textTheme.headline5,
              ),
            ),
          ),
          Container(
            height: context.height * 0.25,
            padding: const EdgeInsets.fromLTRB(
              8.0,
              6.0,
              8.0,
              16.0,
            ),
            width: double.infinity,
            decoration: BoxDecoration(
              color: context.theme.primaryColor,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              children: [
                Text(
                  customerReview.name,
                  maxLines: 1,
                  overflow: TextOverflow.clip,
                  style: context.textTheme.headline6,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8.h),
                Text(
                  customerReview.review,
                  style: context.textTheme.bodyText1!.copyWith(
                    color: Colors.white,
                  ),
                  maxLines: 4,
                  overflow: TextOverflow.clip,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16.h),
                Expanded(
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      customerReview.date,
                      style: context.textTheme.bodyText1!.copyWith(
                        color: Colors.white,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
