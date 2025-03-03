import 'package:sky_weather/core/resources/data_state.dart';
import 'package:sky_weather/features/weather_feature/domain/entities/current_weather_entity.dart';
import 'package:sky_weather/features/weather_feature/domain/entities/forecastdays_weather_entity.dart';
import 'package:sky_weather/features/weather_feature/domain/entities/weather_quality_entity.dart';

abstract class WeatherRepository {
  //? fetch current weather data
  Future<DataState<CurrentWeatherEntity>> fetchCurrentWeatherData(
    String cityName,
  );

  //? fetch forecastdays weather data
  Future<DataState<List<ForecastdaysWeatherEntity>>>
  fetchForecastdaysWeatherData(String cityName);

  //? fetch weather quality data
  Future<DataState<WeatherQualityEntity>> fetchWeatherQualityData(
    String cityName,
  );
}
