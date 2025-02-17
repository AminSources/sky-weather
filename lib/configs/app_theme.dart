import 'package:flutter/material.dart';
import 'package:sky_weather_app/core/constants/colors.dart';

class AppTheme {
  //* Light Theme
  final ThemeData lightThemeData = ThemeData(
    fontFamily: "poppins",
    scaffoldBackgroundColor: Colors.white,
    iconButtonTheme: IconButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: lightGreyColor,
        foregroundColor: greyColor,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(color: greyColor),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(35),
        borderSide: BorderSide.none,
      ),
      fillColor: lightGreyColor,
      filled: true,
    ),
  );
}
