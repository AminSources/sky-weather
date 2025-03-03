import 'package:sky_weather/features/weather_feature/domain/entities/current_weather_entity.dart';

class CurrentWeatherModel extends CurrentWeatherEntity {
  const CurrentWeatherModel({
    super.coord,
    super.weather,
    super.base,
    super.main,
    super.visibility,
    super.wind,
    super.rain,
    super.clouds,
    super.dt,
    super.sys,
    super.timezone,
    super.id,
    super.name,
    super.cod,
  });

  factory CurrentWeatherModel.fromJson(Map<String, dynamic> json) {
    List<Weather> weather = [];
    if (json["weather"] != null) {
      json['weather'].forEach((v) {
        weather.add(Weather.fromJson(v));
      });
    }

    return CurrentWeatherModel(
      coord:
          (json['coord'] as Map<String, dynamic>?) != null
              ? Coord.fromJson(json['coord'] as Map<String, dynamic>)
              : null,
      weather: weather,
      base: json['base'] as String?,
      main:
          (json['main'] as Map<String, dynamic>?) != null
              ? Main.fromJson(json['main'] as Map<String, dynamic>)
              : null,
      visibility: json['visibility'] as int?,
      wind:
          (json['wind'] as Map<String, dynamic>?) != null
              ? Wind.fromJson(json['wind'] as Map<String, dynamic>)
              : null,
      rain:
          (json['rain'] as Map<String, dynamic>?) != null
              ? Rain.fromJson(json['rain'] as Map<String, dynamic>)
              : null,
      clouds:
          (json['clouds'] as Map<String, dynamic>?) != null
              ? Clouds.fromJson(json['clouds'] as Map<String, dynamic>)
              : null,
      dt: json['dt'] as int?,
      sys:
          (json['sys'] as Map<String, dynamic>?) != null
              ? Sys.fromJson(json['sys'] as Map<String, dynamic>)
              : null,
      timezone: json['timezone'] as int?,
      id: json['id'] as int?,
      name: json['name'] as String?,
      cod: json['cod'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
    'coord': coord?.toJson(),
    'weather': weather?.map((e) => e.toJson()).toList(),
    'base': base,
    'main': main?.toJson(),
    'visibility': visibility,
    'wind': wind?.toJson(),
    'rain': rain?.toJson(),
    'clouds': clouds?.toJson(),
    'dt': dt,
    'sys': sys?.toJson(),
    'timezone': timezone,
    'id': id,
    'name': name,
    'cod': cod,
  };
}

class Coord {
  final dynamic lon;
  final dynamic lat;

  Coord({this.lon, this.lat});

  Coord.fromJson(Map<String, dynamic> json)
    : lon = json['lon'] as dynamic,
      lat = json['lat'] as dynamic;

  Map<String, dynamic> toJson() => {'lon': lon, 'lat': lat};
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

class Main {
  final dynamic temp;
  final dynamic feelsLike;
  final dynamic tempMin;
  final dynamic tempMax;
  final dynamic pressure;
  final dynamic humidity;
  final dynamic seaLevel;
  final dynamic grndLevel;

  Main({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.humidity,
    this.seaLevel,
    this.grndLevel,
  });

  Main.fromJson(Map<String, dynamic> json)
    : temp = json['temp'] as dynamic,
      feelsLike = json['feels_like'] as dynamic,
      tempMin = json['temp_min'] as dynamic,
      tempMax = json['temp_max'] as dynamic,
      pressure = json['pressure'] as dynamic,
      humidity = json['humidity'] as dynamic,
      seaLevel = json['sea_level'] as dynamic,
      grndLevel = json['grnd_level'] as dynamic;

  Map<String, dynamic> toJson() => {
    'temp': temp,
    'feels_like': feelsLike,
    'temp_min': tempMin,
    'temp_max': tempMax,
    'pressure': pressure,
    'humidity': humidity,
    'sea_level': seaLevel,
    'grnd_level': grndLevel,
  };
}

class Wind {
  final dynamic speed;
  final dynamic deg;
  final dynamic gust;

  Wind({this.speed, this.deg, this.gust});

  Wind.fromJson(Map<String, dynamic> json)
    : speed = json['speed'] as dynamic,
      deg = json['deg'] as dynamic,
      gust = json['gust'] as dynamic;

  Map<String, dynamic> toJson() => {'speed': speed, 'deg': deg, 'gust': gust};
}

class Rain {
  final dynamic rain;

  Rain({this.rain});

  Rain.fromJson(Map<String, dynamic> json) : rain = json['rain'] as dynamic;

  Map<String, dynamic> toJson() => {'rain': rain};
}

class Clouds {
  final dynamic all;

  Clouds({this.all});

  Clouds.fromJson(Map<String, dynamic> json) : all = json['all'] as dynamic;

  Map<String, dynamic> toJson() => {'all': all};
}

class Sys {
  final dynamic type;
  final dynamic id;
  final dynamic country;
  final dynamic sunrise;
  final dynamic sunset;

  Sys({this.type, this.id, this.country, this.sunrise, this.sunset});

  Sys.fromJson(Map<String, dynamic> json)
    : type = json['type'] as dynamic,
      id = json['id'] as dynamic,
      country = json['country'] as dynamic,
      sunrise = json['sunrise'] as dynamic,
      sunset = json['sunset'] as dynamic;

  Map<String, dynamic> toJson() => {
    'type': type,
    'id': id,
    'country': country,
    'sunrise': sunrise,
    'sunset': sunset,
  };
}
