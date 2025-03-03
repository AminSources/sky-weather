import 'package:flutter/material.dart';
import 'package:sky_weather/core/widgets/onboarding_page.dart';
import 'package:sky_weather/features/check_update_feature/presentation/pages/check_update_page.dart';
import 'package:sky_weather/features/weather_feature/presentation/pages/weather_page.dart';

class Routes {
  final Map<String, WidgetBuilder> routes = {
    "/onboarding": (_) => const OnboardingPage(),
    "/weather": (_) => const WeatherPage(),
    "/checkupdate": (_) => const CheckUpdatePage(),
  };
}
