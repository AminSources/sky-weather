//? convert aqi to status
String convertAqitoStatus(int quality) {
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
