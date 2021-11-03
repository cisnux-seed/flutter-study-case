import 'package:resto_app/presentation/routes/app_views.dart';
import 'package:resto_app/data/db/database_repo.dart';
import 'package:resto_app/domain/auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final _obscureText = Rx<bool>(true);
  late final TextEditingController _usernameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  final DatabaseHelper _firestoreHelper = DatabaseHelper();

  @override
  void onInit() {
    super.onInit();
    _usernameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void onClose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.onClose();
  }

  TextEditingController get usernameController => _usernameController;
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;

  Future<void> register(
    String username,
    String email,
    String password,
  ) async {
    if (username.isEmpty) {
      Get.defaultDialog(
        titlePadding: EdgeInsets.only(top: 20.0),
        title: 'Sign Up Error',
        titleStyle: Get.textTheme.headline6!.copyWith(
          color: Get.theme.primaryColor,
        ),
        middleText: 'Please enter username',
        middleTextStyle: Get.textTheme.bodyText1!,
      );
    } else if (email.isEmail == false) {
      Get.defaultDialog(
        titlePadding: EdgeInsets.only(top: 20.0),
        title: 'Sign Up Error',
        titleStyle: Get.textTheme.headline6!.copyWith(
          color: Get.theme.primaryColor,
        ),
        middleText: 'Please enter correct email address',
        middleTextStyle: Get.textTheme.bodyText1!,
      );
    } else if (_customValidatePassword(password) == false) {
      Get.defaultDialog(
        titlePadding: EdgeInsets.only(top: 20.0),
        title: 'Sign Up Error',
        titleStyle: Get.textTheme.headline6!.copyWith(
          color: Get.theme.primaryColor,
        ),
        middleText:
            'Password should be 8 characters\nat least one uppercase letter,one lowercase letter, one number and one special character',
        middleTextStyle: Get.textTheme.bodyText1!,
      );
    } else if (email.isEmail &&
        _customValidatePassword(password) &&
        username.isNotEmpty) {
      var dataResult =
          await AuthUser.createAccount(email: email, password: password);
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
      }, (uid) async {
        createUserProfileWithEmail(
          uid,
          username,
        );
        Get.offAllNamed(RouteName.homeView);
      });
    }
  }

  Future<void> createUserProfileWithEmail(String uid, String username) async {
    var dbResult = await _firestoreHelper.addUserProfile(
      uid: uid,
      username: username,
    );
    dbResult.fold((failed) {
      Get.defaultDialog(
        titlePadding: EdgeInsets.only(top: 20.0),
        title: failed.title!,
        titleStyle: Get.textTheme.headline6!.copyWith(
          color: Get.theme.primaryColor,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
        middleText: failed.message!,
        middleTextStyle: Get.textTheme.bodyText1!,
      );
    }, (_) {});
  }

  /// Password should be eight characters, at least one uppercase letter,
  /// one lowercase letter, one number and one special character
  /// example : `@Fajra123`
  bool _customValidatePassword(String password) {
    var requiredPassword = RegExp(
        r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');
    return requiredPassword.hasMatch(password) ? true : false;
  }

  bool get obscureText => _obscureText.value;
  set obscureText(bool obscureText) => _obscureText.value = obscureText;
}
