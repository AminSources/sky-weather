import 'package:dio/dio.dart';
import 'package:flutter/rendering.dart';
import 'package:sky_weather/core/resources/data_state.dart';
import 'package:sky_weather/features/weather_feature/data/data_source/remote/api_provider.dart';
import 'package:sky_weather/features/weather_feature/data/models/current_weather_model.dart';
import 'package:sky_weather/features/weather_feature/data/models/forecastdays_weather_model.dart';
import 'package:sky_weather/features/weather_feature/data/models/weather_quality_model.dart';
import 'package:sky_weather/features/weather_feature/domain/entities/current_weather_entity.dart';
import 'package:sky_weather/features/weather_feature/domain/entities/forecastdays_weather_entity.dart';
import 'package:sky_weather/features/weather_feature/domain/entities/weather_quality_entity.dart';
import 'package:sky_weather/features/weather_feature/domain/repositories/weather_repository.dart';

class WeatherRepositoryImpl extends WeatherRepository {
  ApiProvider apiProvider = ApiProvider();

  WeatherRepositoryImpl(this.apiProvider);

  //? fetch current weather
  @override
  Future<DataState<CurrentWeatherEntity>> fetchCurrentWeatherData(
    String cityName,
  ) async {
    try {
      //* call current weather api
      Response response = await apiProvider.getCurrentWeatherData(cityName);

      //* status code condition
      if (response.statusCode == 200) {
        //* convert data
        CurrentWeatherEntity currentWeatherEntity =
            CurrentWeatherModel.fromJson(response.data);

        //* return data
        return DataSuccess(currentWeatherEntity);
      } else {
        //* return failed data
        return DataError(
          "Something went wrong! (currentCityWeather - status code)",
        );
      }
    } catch (e) {
      //* return faild data
      debugPrint("$e current error");
      return DataError("Something went wrong! (currentCityWeather - try)");
    }
  }

  //? fetch forecast days weather
  @override
  Future<DataState<List<ForecastdaysWeatherEntity>>>
  fetchForecastdaysWeatherData(String cityName) async {
    try {
      //* call forecast days weather api
      Response response = await apiProvider.getForecastdaysWeatherData(
        cityName,
      );

      //* status code condition
      if (response.statusCode == 200) {
        //* convert data
        List<ForecastdaysWeatherEntity> forecastdaysWeatherEntity = [];

        for (var item in response.data["result"]["list"]) {
          forecastdaysWeatherEntity.add(
            ForecastdaysWeatherModel.fromJson(item),
          );
        }

        //* return data
        return DataSuccess(forecastdaysWeatherEntity);
      } else {
        //* return failed data
        return DataError(
          "Something went wrong! (forecastdaysWeather - status code)",
        );
      }
    } catch (e) {
      //* return faild data
      debugPrint("$e forecast error");
      return DataError("Something went wrong! (forecastdaysWeather - try)");
    }
  }

  //? fetch weather quality
  @override
  Future<DataState<WeatherQualityEntity>> fetchWeatherQualityData(
    String cityName,
  ) async {
    try {
      //* call weather quality api
      Response response = await apiProvider.getWeatherQualityData(cityName);

      //* status code condition
      if (response.statusCode == 200) {
        //* convert data
        WeatherQualityEntity weatherQualityEntity =
            WeatherQualityModel.fromJson(response.data);

        //* return data
        return DataSuccess(weatherQualityEntity);
      } else {
        //* return failed data
        return DataError(
          "Something went wrong! (weatherQuality - status code)",
        );
      }
    } catch (e) {
      //* return faild data
      debugPrint("$e air error");
      return DataError("Something went wrong! (weatherQuality - try)");
    }
  }
}
