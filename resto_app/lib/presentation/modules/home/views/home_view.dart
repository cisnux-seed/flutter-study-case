import 'package:resto_app/presentation/modules/home/controllers/home_controller.dart';
import 'package:resto_app/presentation/modules/home/views/restaurants_home.dart';
import 'package:resto_app/presentation/modules/home/views/user_profile_view.dart';
import 'package:responsive_navigation_bar/responsive_navigation_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'favorite_view.dart';

class HomeView extends GetView<HomeController> {
  static const label = "Home";

  final List<Widget> _navBarView = [
    RestoListView(),
    FavoriteView(),
    UserProfileView(),
  ];

  final List<NavigationBarButton> _bottomNavBarItems = [
    NavigationBarButton(
      icon: Icons.home_rounded,
      text: HomeView.label,
      backgroundColor: Get.theme.primaryColor,
      textColor: Colors.white,
    ),
    NavigationBarButton(
      icon: Icons.favorite_rounded,
      text: FavoriteView.label,
      backgroundColor: Get.theme.primaryColor,
      textColor: Colors.white,
    ),
    NavigationBarButton(
      icon: Icons.person,
      text: UserProfileView.label,
      backgroundColor: Get.theme.primaryColor,
      textColor: Colors.white,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: _navBarView[controller.bottomNavIndex],
        bottomNavigationBar: NavigationBar(
          backgroundOpacity: 1,
          fontSize: 15.sp,
          activeButtonFlexFactor: 60,
          backgroundColor: Colors.white,
          selectedIndex: controller.bottomNavIndex,
          inactiveIconColor: context.theme.primaryColor,
          activeIconColor: Colors.white,
          navigationBarButtons: _bottomNavBarItems,
          onTabChange: (index) => controller.bottomNavIndex = index,
        ),
      ),
    );
  }
}
