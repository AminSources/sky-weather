import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sky_weather_app/core/constants/strings.dart';
import 'package:sky_weather_app/features/weather_feature/models/weather_quality_model.dart';

class WeatherQualityApi {
  //? weather quality api fuction
  Future<WeatherQualityModel> getWeatherQualityData(String cityName) async {
    //? try and catch
    try {
      //* send request
      Response response = await Dio().get(
        "$aqicnApiUrl/$cityName",
        queryParameters: {"token": aqicnApiKey},
      );

      //* check status code
      if (response.statusCode == 200) {
        //* convert and return data
        return WeatherQualityModel.fromJson(response.data);
      } else {
        //* error handle
        debugPrint("Error on status code: ${response.statusCode}");
        throw Exception("Could not get data from weather quality api.");
      }
    } catch (e) {
      //* error handle
      debugPrint("Error on catch weather quality: $e");
      return WeatherQualityModel();
    }
  }
}
