import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// ThemeData for Widget Tree
abstract class ThemeStyle {
  static ThemeData styles = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    accentColor: Color(0xFF23221D),
    hintColor: Color(0xFF939393),
    buttonColor: Colors.blueGrey.shade900,
    appBarTheme: AppBarTheme(
      backwardsCompatibility: false,
      systemOverlayStyle: SystemUiOverlayStyle.light,
    ),
    textSelectionTheme: TextSelectionThemeData(
      selectionColor: Colors.blue,
      selectionHandleColor: Colors.transparent,
    ),
  );
}
