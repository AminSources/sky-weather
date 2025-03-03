import 'package:dio/dio.dart';
import 'package:sky_weather/core/constants/strings.dart';

class ApiProvider {
  //* dio pkg
  Dio dio = Dio();

  //? get current weather data api
  Future<dynamic> getCurrentWeatherData(String cityName) async {
    //? call api
    Response response = await dio.get(
      openWeatherMapApiUrl,
      queryParameters: {
        "q": cityName,
        "appid": openWeatherMapApiKey,
        "units": "metric",
      },
    );

    //* return data
    return response;
  }

  //? get forecastdays weather data api
  Future<dynamic> getForecastdaysWeatherData(String cityName) async {
    //? call api
    Response response = await dio.get(
      oneServiceApiUrl,
      queryParameters: {
        "token": oneServiceApiKey,
        "action": "daily",
        "city": cityName,
      },
    );

    //* return data
    return response;
  }

  //? get weather quality data api
  Future<dynamic> getWeatherQualityData(String cityName) async {
    //? call api
    Response response = await Dio().get(
      "$aqicnApiUrl/$cityName",
      queryParameters: {"token": aqicnApiKey},
    );

    //* return data
    return response;
  }
}
