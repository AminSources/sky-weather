//? convert weather main to icon ( png format )
String convertMainToPngIcon(String main) {
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
