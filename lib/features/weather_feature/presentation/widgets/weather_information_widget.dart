import 'package:flutter/material.dart';
import 'package:sky_weather/core/constants/colors.dart';
import 'package:sky_weather/core/utils/visibility_converter.dart';
import 'package:sky_weather/core/widgets/txt.dart';
import 'package:sky_weather/features/weather_feature/domain/entities/current_weather_entity.dart';

class WeatherInformationWidget extends StatelessWidget {
  final CurrentWeatherEntity currentWeatherEntity;

  const WeatherInformationWidget({
    super.key,
    required this.currentWeatherEntity,
  });

  @override
  Widget build(BuildContext context) {
    //* title list
    List<String> titleList = [
      "Wind speed",
      "Pressure",
      "Humidity",
      "Visibility",
    ];

    //* detail list
    List<String> detailList = [
      "${currentWeatherEntity.wind!.speed} km/h",
      "${currentWeatherEntity.main!.pressure} hPa",
      "${currentWeatherEntity.main!.humidity} %",
      "${visibilityConverter(currentWeatherEntity.visibility!)} km",
    ];

    return SizedBox(
      width: double.infinity,
      height: 140,
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        runAlignment: WrapAlignment.spaceBetween,
        children: List.generate(
          4,
          (index) => Container(
            width: MediaQuery.sizeOf(context).width * 0.5 - 25,
            height: 65,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //* title
                  txt(titleList[index], color: greyColor),

                  //* detail
                  txt(detailList[index]),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
