import 'package:flutter/material.dart';
import 'package:resto_app/presentation/routes/app_views.dart';
import 'package:resto_app/domain/auth/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

enum LoginState { Finish, Loading }

class LoginController extends GetxController {
  final _obscureText = Rx<bool>(true);
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  final _loginState = Rx<LoginState>(LoginState.Finish);

  @override
  void onInit() {
    super.onInit();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void onClose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.onClose();
  }

  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;

  LoginState get loginState => _loginState.value;
  set loginState(LoginState loginState) => _loginState.value = loginState;

  bool get obscureText => _obscureText.value;
  set obscureText(bool obscureText) => _obscureText.value = obscureText;

  Future<void> loginWithEmail(String email, String password) async {
    if (email.isEmail) {
      loginState = LoginState.Loading;
      var dataResult = await AuthUser.loginWithEmailAndPassword(
        email: email,
        password: password,
      );
      dataResult.fold((failed) {
        Get.defaultDialog(
          titlePadding: EdgeInsets.only(top: 20.0),
          title: failed.title!,
          titleStyle: Get.textTheme.headline6!.copyWith(
            color: Get.theme.primaryColor,
          ),
          middleText: failed.message!,
          middleTextStyle: Get.textTheme.bodyText1!,
        );
        loginState = LoginState.Finish;
      }, (_) {
        loginState = LoginState.Finish;
        Get.offAllNamed(RouteName.homeView);
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

  Future<void> loginWithGmail() async {
    var dataResult = await AuthUser.signInWithGmail();
    dataResult.fold((failed) {
      Get.defaultDialog(
        titlePadding: EdgeInsets.only(top: 20.0),
        title: failed.title!,
        titleStyle: Get.textTheme.headline6!.copyWith(
          color: Get.theme.primaryColor,
        ),
        middleText: failed.message!,
        middleTextStyle: Get.textTheme.bodyText1!,
      );
    }, (success) {
      /// to avoid null error
      if (success != null) {
        Get.offAllNamed(RouteName.homeView);
      }
    });
  }
}
