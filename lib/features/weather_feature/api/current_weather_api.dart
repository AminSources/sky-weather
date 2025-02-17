import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sky_weather_app/core/constants/strings.dart';
import 'package:sky_weather_app/features/weather_feature/models/current_weather_model.dart';

class CurrentWeatherApi {
  //? current weather api fuction
  Future<CurrentWeatherModel> getCurrentWeatherData(String cityName) async {
    //? try and catch
    try {
      //* send request
      Response response = await Dio().get(
        openWeatherMapApiUrl,
        queryParameters: {"q": cityName, "appid": openWeatherMapApiKey},
      );

      //* check status code
      if (response.statusCode == 200) {
        print(response.data);
        //* convert and return data
        return CurrentWeatherModel.fromJson(response.data);
      } else {
        //* error handle
        debugPrint("Error on status code: ${response.statusCode}");
        throw Exception("Could not get data from current weather api.");
      }
    } catch (e) {
      //* error handle
      debugPrint("Error on catch current weather: $e");
      throw Exception("Could not load current weather api.");
    }
  }
}
