import 'package:calculator/app/modules/home/utils/theme_color.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum ThemeStatus { light, dark }

class ThemeController extends GetxController with StateMixin<ThemeData> {
  var theme = ThemeColor.lightMode.obs;

  @override
  void onInit() async {
    await getTheme();
    super.onInit();
  }

  Future<void> changeTheme(ThemeStatus themeStatus) async {
    saveStatusTheme(themeStatus.index);
    theme.value = (themeStatus.index == ThemeStatus.dark.index)
        ? ThemeColor.darkMode
        : ThemeColor.lightMode;
    change(theme.value, status: RxStatus.success());
  }

  Future<void> getTheme() async {
    var currentThemeStatus = await Future.delayed(
      Duration(milliseconds: 1500),
      () => getStatusTheme(),
    );
    theme.value = (currentThemeStatus == ThemeStatus.dark.index)
        ? ThemeColor.darkMode
        : ThemeColor.lightMode;
    change(theme.value, status: RxStatus.success());
  }

  void saveStatusTheme(int value) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setInt('theme', value);
  }

  Future<int> getStatusTheme() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getInt('theme') ?? 0;
  }
}
