import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:resto_app/presentation/routes/app_views.dart';
import '/data/models/model_restaurant.dart';
import 'package:flutter/material.dart';

import 'all_card_resto.dart';

class GenerateAllResto extends StatelessWidget {
  const GenerateAllResto({
    required this.restaurants,
    this.physics,
  });

  final List<Restaurant> restaurants;
  final ScrollPhysics? physics;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      itemCount: restaurants.length,
      shrinkWrap: true,
      separatorBuilder: (_, __) => SizedBox(height: 16.h),
      physics: physics ?? ClampingScrollPhysics(),
      itemBuilder: (_, index) => AllCardResto(
        onTap: () => Get.toNamed(
          RouteName.restoProfileView,
          arguments: restaurants[index].id,
        ),
        restaurant: restaurants[index],
      ),
    );
  }
}
