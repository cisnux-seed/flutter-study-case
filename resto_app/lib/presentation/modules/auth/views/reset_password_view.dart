import 'package:resto_app/presentation/modules/auth/controllers/reset_password_controller.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordView extends GetView<ResetPasswordController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: context.width * 0.75,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(height: 150.h),
                Text(
                  'Reset Password',
                  style: context.textTheme.headline4,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 14.h),
                Text(
                  "Enter your registered email below to receive password reset instruction\nWarning: This will delete your any other accounts linked to your account",
                  style: context.textTheme.bodyText1!.copyWith(
                    color: Colors.white,
                    fontSize: 14.sp,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20.h),
                Container(
                  padding: const EdgeInsets.only(right: 8.0),
                  width: context.width * 0.7,
                  child: TextField(
                    maxLines: 1,
                    controller: controller.emailController,
                    style: context.textTheme.headline6!
                        .copyWith(color: context.theme.primaryColor),
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.email_rounded,
                        color: context.theme.primaryColor,
                      ),
                      hintText: 'Email Address',
                      hintStyle: context.theme.inputDecorationTheme.hintStyle!
                          .copyWith(fontSize: 15.sp),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                SizedBox(height: 14.h),
                ElevatedButton(
                  onPressed: () async =>
                      controller.resetPassword(controller.emailController.text),
                  child: Text(
                    'Reset',
                    style: context.textTheme.bodyText1!.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: context.theme.primaryColor,
                    fixedSize: Size(
                      context.width * 0.7,
                      context.height * 0.045,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    textStyle: context.textTheme.bodyText1!
                        .copyWith(color: Colors.white),
                  ),
                ),
                SizedBox(height: 16.h),
              ],
            ),
          ),
          ClipPath(
            clipper: WaveClipperTwo(reverse: true),
            child: Container(
              height: context.height * 0.32,
              width: context.width,
              color: context.theme.primaryColor,
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Remember Password?",
                    style: context.textTheme.bodyText1!
                        .copyWith(color: Colors.white),
                  ),
                  SizedBox(width: 4.w),
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Text(
                      'Sign In',
                      style: context.textTheme.bodyText1!
                          .copyWith(color: Colors.amber),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
