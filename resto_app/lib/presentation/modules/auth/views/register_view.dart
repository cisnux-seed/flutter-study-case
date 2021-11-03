import 'package:resto_app/presentation/modules/auth/controllers/register_controller.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterView extends GetView<RegisterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: context.width * 0.7,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 55.h),
                  Text(
                    'Create\nAccount',
                    style: context.textTheme.headline4,
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 20.h),
                  Container(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: TextField(
                      maxLines: 1,
                      controller: controller.usernameController,
                      style: context.textTheme.headline6!
                          .copyWith(color: context.theme.primaryColor),
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        hintMaxLines: 1,
                        prefixIcon: Icon(
                          Icons.person,
                          color: context.theme.primaryColor,
                        ),
                        hintText: 'Username',
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
                  Container(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: TextField(
                      maxLines: 1,
                      controller: controller.emailController,
                      style: context.textTheme.headline6!
                          .copyWith(color: context.theme.primaryColor),
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
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
                  Container(
                    child: Obx(
                      () => TextField(
                        maxLines: 1,
                        controller: controller.passwordController,
                        style: context.textTheme.headline6!
                            .copyWith(color: context.theme.primaryColor),
                        obscureText: controller.obscureText,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.vpn_key_rounded,
                            color: context.theme.primaryColor,
                          ),
                          hintText: 'Password',
                          hintStyle: context
                              .theme.inputDecorationTheme.hintStyle!
                              .copyWith(fontSize: 15.sp),
                          suffixIcon: IconButton(
                            icon: controller.obscureText
                                ? Icon(
                                    Icons.visibility_off_rounded,
                                    color: context.theme.primaryColor,
                                  )
                                : Icon(
                                    Icons.visibility_rounded,
                                    color: context.theme.primaryColor,
                                  ),
                            onPressed: () => controller.obscureText =
                                !controller.obscureText,
                          ),
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  SizedBox(height: 14.h),
                  ElevatedButton(
                    onPressed: () => controller.register(
                      controller.usernameController.text,
                      controller.emailController.text,
                      controller.passwordController.text,
                    ),
                    child: Text(
                      'Register',
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
                height: context.height * 0.27,
                width: context.width,
                color: context.theme.primaryColor,
                padding: const EdgeInsets.only(top: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
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
      ),
    );
  }
}
