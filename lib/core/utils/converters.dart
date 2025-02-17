//? temp converter
int tempConvert(int temp) {
  //* kelvin to celsius
  return temp - 273;
}

//? time converter - convert time to 12 hour format
String time12Hour(String time) {
  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(
    int.parse(time) * 1000,
  );
  int hour = dateTime.hour;
  int minute = dateTime.minute;
  String period = hour >= 12 ? 'PM' : 'AM';
  hour = hour % 12;
  hour = hour != 0 ? hour : 12; // the hour '0' should be '12'
  String minuteStr = minute < 10 ? '0$minute' : '$minute';
  return '$hour:$minuteStr $period';
}

//? time converter - convert time to day format with calendar day
String timeDayWithCalendar(String time) {
  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(
    int.parse(time) * 1000,
  );
  List<String> days = [
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
  ];
  String day = days[dateTime.weekday % 7];
  String calendarDay = '${dateTime.month}/${dateTime.day}';
  return '$day, $calendarDay';
}

//? icon converter
String weatherIconConverter(String main) {
  switch (main) {
    case "Clear":
      return "clear-day";
    case "Thunderstorm":
      return "thunderstorm";
    case "Drizzle":
      return "showers";
    case "Rain":
      return "heavy-showers";
    case "Snow":
      return "snow";
    case "Mist":
      return "windy";
    case "Clouds":
      return "cloudy";
    default:
      return "windy";
  }
}
