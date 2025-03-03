import 'package:flutter/material.dart';
import 'package:sky_weather/core/constants/colors.dart';

class AppTheme {
  //? light theme configs
  final ThemeData lightTheme = ThemeData(
    fontFamily: "poppins",
    scaffoldBackgroundColor: whiteColor,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: blueColor,
      onPrimary: blackColor,
      secondary: greyColor,
      onSecondary: whiteColor,
      error: redColor,
      onError: whiteColor,
      surface: lightGreyColor,
      onSurface: blackColor,
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide.none,
      ),
      fillColor: lightGreyColor,
      filled: true,
      hintStyle: TextStyle(color: greyColor),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: blueColor,
        foregroundColor: whiteColor,
        elevation: 0,
      ),
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      borderRadius: BorderRadius.circular(15),
    ),
  );

  //? dark theme configs
  final ThemeData darkTheme = ThemeData(
    fontFamily: "poppins",
    scaffoldBackgroundColor: darkColor,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: blueColor,
      onPrimary: whiteColor,
      secondary: greyColor,
      onSecondary: whiteColor,
      error: redColor,
      onError: whiteColor,
      surface: lightDarkColor,
      onSurface: whiteColor,
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide.none,
      ),
      fillColor: lightDarkColor,
      filled: true,
      hintStyle: TextStyle(color: greyColor),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: blueColor,
        foregroundColor: whiteColor,
        elevation: 0,
      ),
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      borderRadius: BorderRadius.circular(15),
    ),
  );
}
