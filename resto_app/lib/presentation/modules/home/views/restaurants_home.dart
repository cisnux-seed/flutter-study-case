import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resto_app/presentation/modules/widgets/generate_vertical_shimmer.dart';
import '/presentation/modules/home/widgets/search_button.dart';
import '/presentation/routes/app_views.dart';
import '/presentation/modules/home/controllers/home_controller.dart';
import '../../widgets/generate_horizontal_shimmer.dart';
import '../widgets/generate_recommended_resto.dart';
import '../../widgets/generate_all_resto.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RestoListView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            bottom: context.mediaQuery.padding.bottom,
            left: context.mediaQuery.padding.left + 16.0,
            right: context.mediaQuery.padding.right + 16.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Find Your\nFavorite\nFood !',
                style: context.textTheme.headline2!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 16.h),
              SearchButton(
                onTap: () => Get.toNamed(RouteName.searchView),
              ),
              SizedBox(height: 16.h),
              Text(
                'Recommended',
                style: context.textTheme.headline4!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 16.h),
              Obx(
                () => controller.homeResultState == HomeResultState.Loading
                    ? GenerateHorizontalShimmer(
                        height: 180.h,
                        width: context.width * 0.5,
                      )
                    : GenerateRecommendedResto(
                        restaurants: controller.recommendedResto,
                      ),
              ),
              SizedBox(height: 16.h),
              Text(
                'All Restaurant',
                style: context.textTheme.headline4!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 16.h),
              Obx(
                () => controller.homeResultState == HomeResultState.Loading
                    ? GenerateVerticalShimmer(
                        physics: NeverScrollableScrollPhysics(),
                      )
                    : GenerateAllResto(
                        restaurants: controller.allResto,
                        physics: NeverScrollableScrollPhysics(),
                      ),
              ),
              SizedBox(height: 16.h),
            ],
          ),
        ),
      ),
    );
  }
}
