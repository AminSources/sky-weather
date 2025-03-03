import 'package:intl/intl.dart';

//? convert unix time to time ( day, hour am/pm )
String convertUnixTimeToReadableDayHour(int unixTime) {
  final dateTime = DateTime.fromMillisecondsSinceEpoch(unixTime * 1000);
  final dateFormat = DateFormat('EEE, h:mm a');
  return dateFormat.format(dateTime);
}

//? convert unix time to readable time ( hour am/pm )
String convertUnixTimeToReadableHour(int unixTime) {
  final dateTime = DateTime.fromMillisecondsSinceEpoch(unixTime * 1000);
  final timeFormat = DateFormat('h:mm a');
  return timeFormat.format(dateTime);
}

//? covert unix time to readable date ( day )
String convertUnixTimeToReadableDay(int unixTime) {
  final dateTime = DateTime.fromMillisecondsSinceEpoch(unixTime * 1000);
  final dayFormat = DateFormat('EEEE');
  return dayFormat.format(dateTime);
}

//? convert unix time to readable date ( MM/dd )
String convertUnixTimeToReadableMonthDay(int unixTime) {
  final dateTime = DateTime.fromMillisecondsSinceEpoch(unixTime * 1000);
  final dateFormat = DateFormat('MM/dd');
  return dateFormat.format(dateTime);
}

//? calculate day length
double calculateDayLength({int? sunriseUnix, int? sunsetUnix}) {
  final sunrise = DateTime.fromMillisecondsSinceEpoch(sunriseUnix! * 1000);
  final sunset = DateTime.fromMillisecondsSinceEpoch(sunsetUnix! * 1000);

  //* Calculate the day length
  final dayLength = sunset.difference(sunrise);

  //* Return the day length in hours
  return dayLength.inMinutes / 60.0;
}

//? calculate night length
double calculateNightLength({int? nextSunriseUnix, int? sunsetUnix}) {
  final sunset = DateTime.fromMillisecondsSinceEpoch(sunsetUnix! * 1000);
  final nextSunrise = DateTime.fromMillisecondsSinceEpoch(
    nextSunriseUnix! * 1000,
  );
  final midnight = DateTime(sunset.year, sunset.month, sunset.day);

  //* Calculate the duration from sunset to the midnight
  final durationFromSunsetToMidnight = sunset.difference(midnight);

  //* Calculate the duration from midnight to the next sunrise
  final durationFromMidnightToSunrise = nextSunrise.difference(midnight);

  //* Sum the two durations to get the total night length
  final totalNightLength =
      durationFromSunsetToMidnight + durationFromMidnightToSunrise;

  //* Return the night length in hours
  return totalNightLength.inMinutes / 60.0;
}

//? calculate time left to sunset/sunrise
double calculateTimeLeftToSunsetSunrise(int timeUnix) {
  final currentTime = DateTime.now();
  final time = DateTime.fromMillisecondsSinceEpoch(timeUnix * 1000);

  //* Calculate the time left
  final timeLeft = currentTime.difference(time);

  //* Return the time left in hours and minutes
  return timeLeft.inMinutes / 60.0; // Returns the time left in hours
}

//? calculate percentage of day/night left
double calculatePercentageOfDayNightLeft(
  double timeLeftToSunsetSunrise,
  double dayNightLength,
) {
  //* Calculate the percentage of the day left
  double elpasedtime = dayNightLength - timeLeftToSunsetSunrise;

  return (elpasedtime / dayNightLength);
}

//? calculate sunset or sunrise
String calculateSunsetSunriseEvent({int? sunriseUnix}) {
  final sunrise = DateTime.fromMillisecondsSinceEpoch(sunriseUnix! * 1000);
  final currentTime = DateTime.now();

  if (currentTime.isAfter(sunrise)) {
    return "sunset";
  } else {
    return "sunrise";
  }
}
