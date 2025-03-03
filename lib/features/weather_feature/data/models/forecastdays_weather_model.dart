import 'package:sky_weather/features/weather_feature/domain/entities/forecastdays_weather_entity.dart';

class ForecastdaysWeatherModel extends ForecastdaysWeatherEntity {
  const ForecastdaysWeatherModel({
    super.dt,
    super.sunrise,
    super.sunset,
    super.temp,
    super.feelsLike,
    super.pressure,
    super.humidity,
    super.weather,
    super.speed,
    super.deg,
    super.gust,
    super.clouds,
    super.pop,
    super.snow,
  });

  factory ForecastdaysWeatherModel.fromJson(Map<String, dynamic> json) {
    return ForecastdaysWeatherModel(
      dt: json['dt'] as dynamic,
      sunrise: json['sunrise'] as dynamic,
      sunset: json['sunset'] as dynamic,
      temp:
          (json['temp'] as Map<String, dynamic>?) != null
              ? Temp.fromJson(json['temp'] as Map<String, dynamic>)
              : null,
      feelsLike:
          (json['feels_like'] as Map<String, dynamic>?) != null
              ? FeelsLike.fromJson(json['feels_like'] as Map<String, dynamic>)
              : null,
      pressure: json['pressure'] as dynamic,
      humidity: json['humidity'] as dynamic,
      weather:
          (json['weather'] as List?)
              ?.map((dynamic e) => Weather.fromJson(e as Map<String, dynamic>))
              .toList(),
      speed: json['speed'] as dynamic,
      deg: json['deg'] as dynamic,
      gust: json['gust'] as dynamic,
      clouds: json['clouds'] as dynamic,
      pop: json['pop'] as dynamic,
      snow: json['snow'] as dynamic,
    );
  }

  Map<String, dynamic> toJson() => {
    'dt': dt,
    'sunrise': sunrise,
    'sunset': sunset,
    'temp': temp?.toJson(),
    'feels_like': feelsLike?.toJson(),
    'pressure': pressure,
    'humidity': humidity,
    'weather': weather?.map((e) => e.toJson()).toList(),
    'speed': speed,
    'deg': deg,
    'gust': gust,
    'clouds': clouds,
    'pop': pop,
    'snow': snow,
  };
}

class Temp {
  final dynamic day;
  final dynamic min;
  final dynamic max;
  final dynamic night;
  final dynamic eve;
  final dynamic morn;

  Temp({this.day, this.min, this.max, this.night, this.eve, this.morn});

  Temp.fromJson(Map<String, dynamic> json)
    : day = json['day'] as dynamic,
      min = json['min'] as dynamic,
      max = json['max'] as dynamic,
      night = json['night'] as dynamic,
      eve = json['eve'] as dynamic,
      morn = json['morn'] as dynamic;

  Map<String, dynamic> toJson() => {
    'day': day,
    'min': min,
    'max': max,
    'night': night,
    'eve': eve,
    'morn': morn,
  };
}

class FeelsLike {
  final dynamic day;
  final dynamic night;
  final dynamic eve;
  final dynamic morn;

  FeelsLike({this.day, this.night, this.eve, this.morn});

  FeelsLike.fromJson(Map<String, dynamic> json)
    : day = json['day'] as dynamic,
      night = json['night'] as dynamic,
      eve = json['eve'] as dynamic,
      morn = json['morn'] as dynamic;

  Map<String, dynamic> toJson() => {
    'day': day,
    'night': night,
    'eve': eve,
    'morn': morn,
  };
}

class Weather {
  final int? id;
  final String? main;
  final String? description;
  final String? icon;

  Weather({this.id, this.main, this.description, this.icon});

  Weather.fromJson(Map<String, dynamic> json)
    : id = json['id'] as int?,
      main = json['main'] as String?,
      description = json['description'] as String?,
      icon = json['icon'] as String?;

  Map<String, dynamic> toJson() => {
    'id': id,
    'main': main,
    'description': description,
    'icon': icon,
  };
}
