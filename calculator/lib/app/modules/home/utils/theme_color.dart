import 'package:flutter/material.dart';

abstract class ThemeColor {
  static var darkMode = ThemeData(
    scaffoldBackgroundColor: const Color(0xFF243441),
    primaryColor: const Color(0xFFEB8034),
    accentColor: const Color(0xFF697782),
    brightness: Brightness.dark,
  );

  static var lightMode = ThemeData(
    scaffoldBackgroundColor: const Color(0xFFEBEBEB),
    primaryColor: const Color(0xFFEB8034),
    accentColor: const Color(0xFFB7B8BA),
    brightness: Brightness.light,
  );
}
