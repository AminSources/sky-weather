import 'package:flutter/material.dart';
import 'package:sky_weather_app/core/constants/colors.dart';
import 'package:sky_weather_app/core/utils/converters.dart';
import 'package:sky_weather_app/core/widgets/txt.dart';
import 'package:sky_weather_app/features/weather_feature/models/current_weather_model.dart';

class SunriseSunsetWidget extends StatelessWidget {
  final CurrentWeatherModel data;
  const SunriseSunsetWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        2,
        (index) => Container(
          width: MediaQuery.sizeOf(context).width * 0.425,
          height: 75,
          decoration: BoxDecoration(
            color: lightGreyColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: [
                //* title
                txt(
                  index == 0 ? "Sunrise" : "Sunset",
                  size: 14,
                  color: greyColor,
                ),

                // space
                SizedBox(height: 5),

                //* data
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //* icon
                    Image.asset(
                      index == 0
                          ? "lib/assets/images/clear-day.png"
                          : "lib/assets/images/moon.png",
                      width: 25,
                      height: 25,
                    ),

                    //* time
                    txt(
                      index == 0
                          ? time12Hour(data.sys!.sunrise.toString())
                          : time12Hour(data.sys!.sunset.toString()),
                      size: 16,
                      color: greyColor,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
