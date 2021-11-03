import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resto_app/domain/auth/auth.dart';

class ResetPasswordController extends GetxController {
  late final TextEditingController _emailController;

  @override
  void onInit() {
    super.onInit();
    _emailController = TextEditingController();
  }

  @override
  void onClose() {
    _emailController.dispose();
    super.onClose();
  }

  TextEditingController get emailController => _emailController;
  Future<void> resetPassword(String email) async {
    if (email.isEmail) {
      var dbResult = await AuthUser.resetPassword(email);
      dbResult.fold((failed) {
        Get.defaultDialog(
          titlePadding: EdgeInsets.only(top: 10.0),
          title: failed.title!,
          titleStyle: Get.textTheme.headline6!.copyWith(
            color: Get.theme.primaryColor,
          ),
          middleText: failed.message!,
          middleTextStyle: Get.textTheme.bodyText1!,
        );
      }, (_) {
        Get.defaultDialog(
            titlePadding: EdgeInsets.only(top: 10.0),
            title: 'Email has been sent!',
            titleStyle: Get.textTheme.headline6!.copyWith(
              color: Get.theme.primaryColor,
            ),
            middleText:
                'Please check your inbox and click\nin the received link to reset a password',
            middleTextStyle: Get.textTheme.bodyText1!,
            confirmTextColor: Colors.white,
            textConfirm: 'Login',
            buttonColor: Get.theme.primaryColor,
            onConfirm: () {
              Get.back();
              Get.back();
            });
      });
    } else {
      Get.defaultDialog(
        titlePadding: EdgeInsets.only(top: 20.0),
        title: 'Sign Up Error',
        titleStyle: Get.textTheme.headline6!.copyWith(
          color: Get.theme.primaryColor,
        ),
        middleText: 'Please enter correct email address',
        middleTextStyle: Get.textTheme.bodyText1!,
      );
    }
  }
}
