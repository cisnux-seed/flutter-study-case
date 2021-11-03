import 'package:resto_app/presentation/modules/home/controllers/user_profile_controller.dart';
import 'package:resto_app/presentation/modules/widgets/generate_all_resto.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteView extends GetView<UserProfileController> {
  static const label = "Favorites";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Favorites',
          style: context.textTheme.headline5,
        ),
      ),
      body: Obx(
        () => controller.favoritesResto.isNotEmpty
            ? Padding(
                padding: EdgeInsets.only(
                  top: context.mediaQuery.padding.top,
                  left: context.mediaQuery.padding.left + 16.0,
                  right: context.mediaQuery.padding.right + 16.0,
                  bottom: context.mediaQuery.padding.bottom + 20.0,
                ),
                child: GenerateAllResto(restaurants: controller.favoritesResto),
              )
            : Center(
                child: Text(
                  'No Favorites Restaurant',
                  style: context.textTheme.headline6,
                ),
              ),
      ),
    );
  }
}
