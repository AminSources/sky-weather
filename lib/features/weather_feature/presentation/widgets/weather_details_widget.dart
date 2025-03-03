import 'package:flutter/material.dart';
import 'package:sky_weather/core/utils/icon_converter.dart';
import 'package:sky_weather/core/utils/time_converter.dart';
import 'package:sky_weather/core/widgets/txt.dart';
import 'package:sky_weather/features/weather_feature/domain/entities/current_weather_entity.dart';

class WeatherDetailsWidget extends StatelessWidget {
  final CurrentWeatherEntity currentWeatherEntity;

  const WeatherDetailsWidget({super.key, required this.currentWeatherEntity});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //* weather details
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //* city name
            txt(
              currentWeatherEntity.name!,
              size: 30,
              fontWeight: FontWeight.bold,
            ),

            //* weather description
            txt(
              currentWeatherEntity.weather![0].description!,
              size: 20,
              fontWeight: FontWeight.w100,
            ),

            //* weather temp
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: txt(
                "${currentWeatherEntity.main!.temp!.round()}\u00B0",
                size: 50,
                fontWeight: FontWeight.bold,
              ),
            ),

            //* min, max temp
            txt(
              "min ${currentWeatherEntity.main!.tempMin!.round()}\u00B0 | max ${currentWeatherEntity.main!.tempMax!.round()}\u00B0 - Feels like ${currentWeatherEntity.main!.feelsLike!.round()}\u00B0",
            ),

            //* weather data time
            txt(convertUnixTimeToReadableDayHour(currentWeatherEntity.dt!)),
          ],
        ),

        //* weather icon
        SizedBox(
          width: 100,
          height: 100,
          child: Image.asset(
            "lib/assets/images/${convertMainToPngIcon(currentWeatherEntity.weather![0].main!)}.png",
          ),
        ),
      ],
    );
  }
}
