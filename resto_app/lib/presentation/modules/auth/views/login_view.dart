import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resto_app/presentation/modules/auth/controllers/login_controller.dart';
import 'package:resto_app/presentation/routes/app_views.dart';

class LoginView extends GetView<LoginController> {
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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 60.h),
                  Text(
                    'Welcome\nBack',
                    style: context.textTheme.headline4,
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 20.h),
                  Container(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: TextField(
                      controller: controller.emailController,
                      maxLines: 1,
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
                        errorBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
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
                        obscureText: controller.obscureText,
                        style: context.textTheme.headline6!
                            .copyWith(color: context.theme.primaryColor),
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
                  Obx(() {
                    if (controller.loginState == LoginState.Loading) {
                      return _buildLoginButton(
                        context,
                        SizedBox(
                          height: 15.h,
                          width: 15.w,
                          child: CircularProgressIndicator(
                            color: context.theme.colorScheme.secondary,
                          ),
                        ),
                      );
                    }
                    return _buildLoginButton(
                      context,
                      Text(
                        'Log in',
                        style: context.textTheme.bodyText1!.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    );
                  }),
                  SizedBox(height: 14.h),
                  GestureDetector(
                    onTap: () => Get.toNamed(RouteName.resetPasswordView),
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Forgot your password?',
                        style: context.textTheme.bodyText2!
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ClipPath(
              clipper: WaveClipperTwo(reverse: true),
              child: Container(
                height: context.height * 0.35,
                width: context.width,
                color: context.theme.primaryColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 24.h),
                    Text(
                      'Or connect with',
                      style: context.textTheme.bodyText1!
                          .copyWith(color: Colors.white),
                    ),
                    SizedBox(height: 16.h),
                    SizedBox(
                      height: context.height * 0.045,
                      width: context.width * 0.5,
                      child: Material(
                        elevation: 2.0,
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.0),
                        child: InkWell(
                          onTap: () async => await controller.loginWithGmail(),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(width: 8.w),
                              SizedBox(
                                height: context.height * 0.025,
                                child: Image(
                                  image:
                                      AssetImage('assets/icon/google_icon.png'),
                                ),
                              ),
                              SizedBox(width: 8.w),
                              Text(
                                'Sign in with Google',
                                style: GoogleFonts.roboto(),
                              ),
                              SizedBox(width: 8.w),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 24.h),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Dont't have account?",
                            style: context.textTheme.bodyText1!
                                .copyWith(color: Colors.white),
                          ),
                          SizedBox(width: 4.w),
                          GestureDetector(
                            onTap: () => Get.toNamed(RouteName.registerView),
                            child: Text(
                              'Sign Up',
                              style: context.textTheme.bodyText1!
                                  .copyWith(color: Colors.amber),
                            ),
                          ),
                        ],
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

  ElevatedButton _buildLoginButton(BuildContext context, Widget child) {
    return ElevatedButton(
      onPressed: () => controller.loginWithEmail(
        controller.emailController.text,
        controller.passwordController.text,
      ),
      child: child,
      style: ElevatedButton.styleFrom(
        primary: context.theme.primaryColor,
        fixedSize: Size(
          context.width * 0.7,
          context.height * 0.045,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        textStyle: context.textTheme.bodyText1!.copyWith(color: Colors.white),
      ),
    );
  }
}
