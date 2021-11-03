import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/data/models/model_restaurant.dart';
import '/presentation/routes/app_views.dart';
import 'recommended_card_resto.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GenerateRecommendedResto extends StatelessWidget {
  const GenerateRecommendedResto({
    required this.restaurants,
  });

  final List<Restaurant> restaurants;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180.h,
      child: ListView.separated(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: restaurants.length,
        itemBuilder: (_, index) => RecommendedCardResto(
          widthCard: context.width * 0.5,
          onTap: () => Get.toNamed(RouteName.restoProfileView,
              arguments: restaurants[index].id),
          restaurant: restaurants[index],
        ),
        separatorBuilder: (_, __) => SizedBox(width: 16.w),
      ),
    );
  }
}
