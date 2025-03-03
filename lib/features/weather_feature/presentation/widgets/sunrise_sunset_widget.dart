import 'package:flutter/material.dart';
import 'package:sky_weather/core/constants/colors.dart';
import 'package:sky_weather/core/utils/sunset_sunrise_percent_converter.dart';
import 'package:sky_weather/core/utils/time_converter.dart';
import 'package:sky_weather/core/widgets/txt.dart';
import 'package:sky_weather/features/weather_feature/domain/entities/current_weather_entity.dart';

class SunriseSunsetWidget extends StatelessWidget {
  final CurrentWeatherEntity currentWeatherEntity;

  const SunriseSunsetWidget({super.key, required this.currentWeatherEntity});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 90,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          //* time
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //* sunrise time
                txt(
                  convertUnixTimeToReadableHour(
                    currentWeatherEntity.sys!.sunrise!,
                  ),
                ),

                //* sunset time
                txt(
                  convertUnixTimeToReadableHour(
                    currentWeatherEntity.sys!.sunset!,
                  ),
                ),
              ],
            ),
          ),

          //* icon
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20, top: 10),
            child: Row(
              children: [
                //* sunrise icon
                Icon(Icons.wb_sunny_rounded, size: 30, color: orangeColor),

                //* day length bar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: SizedBox(
                    width: 224,
                    height: 5,
                    child: LinearProgressIndicator(
                      backgroundColor: greyColor,
                      color:
                          calculateSunsetSunriseEvent(
                                    sunriseUnix:
                                        currentWeatherEntity.sys!.sunrise,
                                  ) ==
                                  "sunset"
                              ? blueColor
                              : orangeColor,
                      value: sunsetSunrisePercentConverter(
                        sunriseUnix: currentWeatherEntity.sys!.sunrise,
                        sunsetUnix: currentWeatherEntity.sys!.sunset,
                      ),
                    ),
                  ),
                ),

                //* sunset icon
                Icon(Icons.dark_mode_rounded, size: 30, color: blueColor),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
