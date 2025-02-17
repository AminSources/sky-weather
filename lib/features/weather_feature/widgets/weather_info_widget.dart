import 'package:flutter/material.dart';
import 'package:sky_weather_app/core/utils/converters.dart';
import 'package:sky_weather_app/core/widgets/txt.dart';
import 'package:sky_weather_app/features/weather_feature/models/current_weather_model.dart';

class WeatherInfoWidget extends StatelessWidget {
  final CurrentWeatherModel data;
  const WeatherInfoWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //* weather icon
        Image.asset(
          "lib/assets/images/${weatherIconConverter(data.weather![0].main!)}.png",
          width: 150,
          height: 150,
        ),

        //* city name
        txt(data.name!.toUpperCase(), size: 28, fontWeight: FontWeight.bold),

        //* weather temp
        txt(
          "${tempConvert(data.main!.temp!.round())} \u00B0",
          size: 50,
          fontWeight: FontWeight.bold,
        ),
      ],
    );
  }
}
