import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:sky_weather_app/core/constants/colors.dart';
import 'package:sky_weather_app/core/widgets/txt.dart';
import 'package:sky_weather_app/features/weather_feature/models/weather_quality_model.dart';

class WeatherQualityProgressbarWidget extends StatelessWidget {
  final WeatherQualityModel data;
  const WeatherQualityProgressbarWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    //* value notifer
    final ValueNotifier<double> valueNotifier = ValueNotifier(0);

    // widget redd
    return SizedBox(
      width: 225,
      height: 225,
      child: DashedCircularProgressBar.aspectRatio(
        aspectRatio: 1, // width ÷ height
        valueNotifier: valueNotifier,
        progress: data.data!.aqi! / 3.25,
        startAngle: 225,
        sweepAngle: 270,
        foregroundColor: weatherQualityProgressBarColor(data.data!.aqi!),
        backgroundColor: const Color(0xffeeeeee),
        foregroundStrokeWidth: 15,
        backgroundStrokeWidth: 15,
        animation: true,
        seekSize: 6,
        seekColor: const Color(0xffeeeeee),
        child: Center(
          child: ValueListenableBuilder(
            valueListenable: valueNotifier,
            builder:
                (_, double value, __) => Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    //* quality value
                    txt(
                      data.data!.aqi.toString(),

                      fontWeight: FontWeight.w300,
                      size: 40,
                    ),

                    // space
                    const SizedBox(height: 10),

                    //* quality text
                    SizedBox(
                      width: 135,
                      child: txt(
                        weatherQualityProgressBarText(data.data!.aqi!),
                        color: greyColor,
                        fontWeight: FontWeight.w400,
                        textAlign: TextAlign.center,
                        size: 16,
                      ),
                    ),
                  ],
                ),
          ),
        ),
      ),
    );
  }
}

Color weatherQualityProgressBarColor(int quality) {
  if (quality >= 0 && quality <= 50) {
    return greenColor;
  } else if (quality >= 51 && quality <= 100) {
    return yellowColor;
  } else if (quality >= 101 && quality <= 150) {
    return orangeColor;
  } else if (quality >= 151 && quality <= 200) {
    return redColor;
  } else if (quality >= 201 && quality <= 300) {
    return purpleColor;
  } else if (quality >= 301) {
    return brownColor;
  } else {
    return blueColor;
  }
}

String weatherQualityProgressBarText(int quality) {
  if (quality >= 0 && quality <= 50) {
    return "Clean";
  } else if (quality >= 51 && quality <= 100) {
    return "Healthy";
  } else if (quality >= 101 && quality <= 150) {
    return "Unhealthy for sensitive groups";
  } else if (quality >= 151 && quality <= 200) {
    return "Unhealthy";
  } else if (quality >= 201 && quality <= 300) {
    return "Very UnHealthy";
  } else if (quality >= 301) {
    return "Hazardous";
  } else {
    return "Unknow";
  }
}
