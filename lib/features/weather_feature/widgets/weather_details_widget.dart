import 'package:flutter/material.dart';
import 'package:sky_weather_app/core/constants/colors.dart';
import 'package:sky_weather_app/core/utils/converters.dart';
import 'package:sky_weather_app/core/widgets/txt.dart';
import 'package:sky_weather_app/features/weather_feature/models/current_weather_model.dart';

class WeatherDetailsWidget extends StatelessWidget {
  final CurrentWeatherModel data;
  const WeatherDetailsWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    //* title list
    List<String> titles = ["time", "wind speed", "pressure", "humidity"];

    //* data list
    List<String> dataList = [
      time12Hour(data.dt.toString()),
      "${data.wind!.speed} m/s",
      "${data.main!.pressure} hPa",
      "${data.main!.humidity} %",
    ];

    return Container(
      width: double.infinity,
      height: 75,
      decoration: BoxDecoration(
        color: lightGreyColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          4,
          (index) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //* title
              txt(titles[index], color: greyColor),

              // space
              SizedBox(height: 5),

              //* detail
              txt(dataList[index]),
            ],
          ),
        ),
      ),
    );
  }
}
