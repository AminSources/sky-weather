import 'package:flutter/material.dart';
import 'package:sky_weather_app/core/constants/colors.dart';
import 'package:sky_weather_app/core/utils/converters.dart';
import 'package:sky_weather_app/core/widgets/txt.dart';
import 'package:sky_weather_app/features/weather_feature/models/forecast_weather_model.dart';

class WeatherForecastdaysWidget extends StatelessWidget {
  final List<ForecastWeatherModel> data;
  const WeatherForecastdaysWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 90,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Container(
            width: 100,
            margin: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              color: lightGreyColor,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(height: 5),
                Column(
                  children: [
                    //* icon
                    Image.asset(
                      "lib/assets/images/${weatherIconConverter(data[index].weather![0].main!)}.png",
                      width: 30,
                      height: 30,
                    ),

                    //* temp
                    txt("${data[index].temp!.day!.round()}"),
                  ],
                ),

                //* day
                txt(timeDayWithCalendar(data[index].dt.toString()), size: 10),
                SizedBox(height: 5),
              ],
            ),
          );
        },
      ),
    );
  }
}
