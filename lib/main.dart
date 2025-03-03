import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sky_weather/core/bloc/onboarding_bloc/onboarding_bloc.dart';
import 'package:sky_weather/core/bloc/theme_bloc/theme_bloc.dart';
import 'package:sky_weather/core/configs/app_theme.dart';
import 'package:sky_weather/core/routes/routes.dart';
import 'package:sky_weather/features/check_update_feature/presentation/bloc/check_update_bloc.dart';
import 'package:sky_weather/features/weather_feature/presentation/bloc/weather_bloc.dart';
import 'package:sky_weather/locator.dart';

void main() async {
  //? init locator
  setup();

  //? init get storage
  await GetStorage.init();

  //? run app
  runApp(
    MultiBlocProvider(
      providers: [
        //* onboarding bloc
        BlocProvider(create: (context) => locator<OnboardingBloc>()),

        //* theme bloc
        BlocProvider(create: (context) => locator<ThemeBloc>()),

        //* weather bloc
        BlocProvider(create: (context) => locator<WeatherBloc>()),

        //* check update bloc
        BlocProvider(create: (context) => locator<CheckUpdateBloc>()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //* get storage
    GetStorage box = GetStorage();

    //* change theme on start
    box.read("theme") == null
        ? null
        : context.read<ThemeBloc>().add(
          ChangeThemeEvent(GetStorage().read("theme")),
        );

    //* check onboarding status
    String onboardingStatus =
        box.read("onboarding") == true ? "/checkupdate" : "/onboarding";

    //* app theme
    AppTheme appTheme = AppTheme();
    ThemeMode themeMode =
        context.watch<ThemeBloc>().state.isDark
            ? ThemeMode.dark
            : ThemeMode.light;

    //* routes
    Routes routes = Routes();

    return SafeArea(
      child: MaterialApp(
        title: "Sky Weather App",
        debugShowCheckedModeBanner: false,
        theme: appTheme.lightTheme,
        darkTheme: appTheme.darkTheme,
        themeMode: themeMode,
        routes: routes.routes,
        initialRoute: onboardingStatus,
      ),
    );
  }
}
