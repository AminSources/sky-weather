class ForecastWeatherModel {
  final int? dt;
  final Temp? temp;
  final List<Weather>? weather;

  ForecastWeatherModel({this.dt, this.temp, this.weather});

  factory ForecastWeatherModel.fromJson(Map<String, dynamic> json) {
    return ForecastWeatherModel(
      dt: json['dt'] as int?,
      temp:
          (json['temp'] as Map<String, dynamic>?) != null
              ? Temp.fromJson(json['temp'] as Map<String, dynamic>)
              : null,
      weather:
          (json['weather'] as List?)
              ?.map((dynamic e) => Weather.fromJson(e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'dt': dt,
    'temp': temp?.toJson(),
    'weather': weather?.map((e) => e.toJson()).toList(),
  };
}

class Temp {
  final dynamic day;

  Temp({this.day});

  Temp.fromJson(Map<String, dynamic> json) : day = (json['day'] as dynamic);

  Map<String, dynamic> toJson() => {'day': day};
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
