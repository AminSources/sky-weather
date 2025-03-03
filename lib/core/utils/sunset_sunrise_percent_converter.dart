import 'package:sky_weather/core/utils/time_converter.dart';

double sunsetSunrisePercentConverter({int? sunriseUnix, int? sunsetUnix}) {
  final event = calculateSunsetSunriseEvent(sunriseUnix: sunriseUnix);

  //* check event ( sunrise or sunset )
  if (event == "sunset") {
    //* check sunrise
    return calculatePercentageOfDayNightLeft(
      calculateTimeLeftToSunsetSunrise(sunriseUnix!),
      calculateNightLength(
        sunsetUnix: sunsetUnix,
        nextSunriseUnix: sunriseUnix,
      ),
    );
  } else {
    //* check sunset
    return calculatePercentageOfDayNightLeft(
      calculateTimeLeftToSunsetSunrise(sunsetUnix!),
      calculateDayLength(sunsetUnix: sunsetUnix, sunriseUnix: sunriseUnix),
    );
  }
}
