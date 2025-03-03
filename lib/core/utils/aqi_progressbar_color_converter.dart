import 'package:flutter/widgets.dart';
import 'package:sky_weather/core/constants/colors.dart';

//? convert quality to color
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
