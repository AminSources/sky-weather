import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sky_weather_app/configs/app_theme.dart';

import 'package:sky_weather_app/features/weather_feature/pages/weather_page.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //* theme
    AppTheme appTheme = AppTheme();

    // widget tree
    return SafeArea(
      child: MaterialApp(
        title: 'Sky Weather',
        debugShowCheckedModeBanner: false,
        theme: appTheme.lightThemeData,

        home: const WeatherPage(),
      ),
    );
  }
}
