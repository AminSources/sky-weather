import 'package:get_it/get_it.dart';
import 'package:sky_weather/core/bloc/onboarding_bloc/onboarding_bloc.dart';
import 'package:sky_weather/core/bloc/theme_bloc/theme_bloc.dart';
import 'package:sky_weather/features/check_update_feature/data/data_source/remote/api_provider.dart';
import 'package:sky_weather/features/check_update_feature/data/repositories/check_update_repository_impl.dart';
import 'package:sky_weather/features/check_update_feature/domain/repositories/check_update_repository.dart';
import 'package:sky_weather/features/check_update_feature/domain/usecases/check_update_usecase.dart';
import 'package:sky_weather/features/check_update_feature/presentation/bloc/check_update_bloc.dart';
import 'package:sky_weather/features/weather_feature/data/data_source/remote/api_provider.dart';
import 'package:sky_weather/features/weather_feature/data/repositories/weather_repository_impl.dart';
import 'package:sky_weather/features/weather_feature/domain/repositories/weather_repository.dart';
import 'package:sky_weather/features/weather_feature/domain/usecases/current_weather_usecase.dart';
import 'package:sky_weather/features/weather_feature/domain/usecases/forecastdays_weather_usecase.dart';
import 'package:sky_weather/features/weather_feature/domain/usecases/weather_quality_usecase.dart';
import 'package:sky_weather/features/weather_feature/presentation/bloc/weather_bloc.dart';

GetIt locator = GetIt.instance;

setup() {
  //? api providers
  //* Weather api provider
  ApiProvider apiProvider = ApiProvider();
  //* check update api provider
  CheckUpdateApiProvider checkUpdateApiProvider = CheckUpdateApiProvider();

  //? repositories
  //* WeatherRepository
  locator.registerSingleton<WeatherRepository>(
    WeatherRepositoryImpl(apiProvider),
  );
  //* CheckUpdateRepository
  locator.registerSingleton<CheckUpdateRepository>(
    CheckUpdateRepositoryImpl(checkUpdateApiProvider),
  );

  //? usecases
  //* CurrentWeatherUsecase
  locator.registerSingleton<CurrentWeatherUsecase>(
    CurrentWeatherUsecase(locator()),
  );
  //* ForecastdaysWeatherUsecase
  locator.registerSingleton<ForecastdaysWeatherUsecase>(
    ForecastdaysWeatherUsecase(locator()),
  );
  //* WeatherQualityUsecase
  locator.registerSingleton<WeatherQualityUsecase>(
    WeatherQualityUsecase(locator()),
  );
  //* CheckUpdateUsecase
  locator.registerSingleton<CheckUpdateUsecase>(CheckUpdateUsecase(locator()));

  //? bloc
  //* weather bloc
  locator.registerSingleton<WeatherBloc>(
    WeatherBloc(locator(), locator(), locator()),
  );
  //* onboarding bloc
  locator.registerSingleton<OnboardingBloc>(OnboardingBloc());
  //* theme bloc
  locator.registerSingleton<ThemeBloc>(ThemeBloc());
  //* check update bloc
  locator.registerSingleton<CheckUpdateBloc>(CheckUpdateBloc(locator()));
}
