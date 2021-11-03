import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// set up all themes
ThemeData styles = ThemeData(
  scaffoldBackgroundColor: Color(0xFF594302),
  primaryColor: Color(0xFF090b0d),
  colorScheme: ColorScheme(
    primary: Color(0xFF090b0d),
    primaryVariant: Color(0xFF090b0d),
    secondary: Color(0xFF594302),
    secondaryVariant: Color(0xFF594302),
    surface: Color(0xFF090b0d),
    background: Color(0xFF594302),
    error: Colors.red,
    onPrimary: Color(0xFF090b0d),
    onSecondary: Color(0xFF594302),
    onSurface: Color(0xFF090b0d),
    onBackground: Color(0xFF594302),
    onError: Colors.red,
    brightness: Brightness.light,
  ),
  hintColor: Colors.grey.shade700,
  appBarTheme: AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle.light,
    backgroundColor: Color(0xFF090b0d),
  ),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: Color(0xFF594302),
    selectionHandleColor: Color(0xFF594302),
  ),
  inputDecorationTheme: InputDecorationTheme(
    enabledBorder: InputBorder.none,
    focusedBorder: InputBorder.none,
    hintStyle: GoogleFonts.roboto(
      fontSize: 18.sp,
      color: Colors.grey.shade700,
    ),
  ),
  visualDensity: VisualDensity.adaptivePlatformDensity,
  textTheme: TextTheme(
    headline1: GoogleFonts.cabin(
      fontWeight: FontWeight.w600,
      fontSize: 76.sp,
      letterSpacing: -1.5,
      color: Colors.white,
    ),
    headline2: GoogleFonts.cabin(
      fontSize: 54.sp,
      fontWeight: FontWeight.w600,
      letterSpacing: -0.5,
      color: Colors.white,
    ),
    headline3: GoogleFonts.cabin(
      fontSize: 43.sp,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    headline4: GoogleFonts.cabin(
      fontSize: 30.sp,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.25,
      color: Colors.white,
    ),
    headline5: GoogleFonts.cabin(
      fontSize: 21.sp,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    headline6: GoogleFonts.cabin(
      fontSize: 18.sp,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.15,
      color: Colors.white,
    ),
    subtitle1: GoogleFonts.cabin(
      fontSize: 14.sp,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.15,
      color: Colors.white,
    ),
    subtitle2: GoogleFonts.cabin(
      fontSize: 13.sp,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.1,
      color: Colors.white,
    ),
    bodyText1: GoogleFonts.roboto(
      fontSize: 14.sp,
      fontWeight: FontWeight.normal,
      letterSpacing: 1.0,
      color: Color(0xFF090b0d),
    ),
  ),
);
