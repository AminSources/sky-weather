import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sky_weather_app/core/constants/strings.dart';
import 'package:sky_weather_app/features/weather_feature/models/forecast_weather_model.dart';

class ForecastWeatherApi {
  //* data list
  List<ForecastWeatherModel> data = [];

  //? forecast weather api function
  Future<List<ForecastWeatherModel>> getForecastWeatherData(
    String cityName,
  ) async {
    //? try and catch
    try {
      //* send request
      Response response = await Dio().get(
        oneServiceApiUrl,
        queryParameters: {
          "token": oneServiceApiKey,
          "action": "daily",
          "city": cityName,
        },
      );

      //* check status code
      if (response.statusCode == 200) {
        //* convert and return data
        print(response.data["result"]["list"]);
        for (var item in response.data["result"]["list"]) {
          data.add(ForecastWeatherModel.fromJson(item));
        }

        return data;
      } else {
        //* error handle
        debugPrint("Error on status code: ${response.statusCode}");
        return data;
      }
    } catch (e) {
      //* error handle
      debugPrint("Error on catch forecast: $e");
      return data;
    }
  }
}
