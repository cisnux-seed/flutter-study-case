import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resto_app/domain/auth/auth.dart';
import 'package:resto_app/presentation/routes/app_views.dart';

class SplashController extends GetxController
    with SingleGetTickerProviderMixin {
  late AnimationController _splashController;
  final _user = Rxn<User>();

  @override
  void onInit() {
    super.onInit();
    _user.bindStream(AuthUser.auth.authStateChanges());
    _splashController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    )
      ..forward()
      ..addListener(() {
        /// 1.0 is equal to 4 seconds
        if (_splashController.value == 1.0) {
          /// check user account state
          /// is login or not?
          if (_user.value != null) {
            Get.offNamed(RouteName.homeView);
          } else {
            Get.offNamed(RouteName.loginView);
          }
        }
      });
  }

  @override
  void onClose() {
    _splashController.dispose();
    super.onClose();
  }

  AnimationController get splashController => _splashController;
}
