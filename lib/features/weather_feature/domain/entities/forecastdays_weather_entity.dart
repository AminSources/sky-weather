import 'package:equatable/equatable.dart';
import 'package:sky_weather/features/weather_feature/data/models/forecastdays_weather_model.dart';

class ForecastdaysWeatherEntity extends Equatable {
  final dynamic dt;
  final dynamic sunrise;
  final dynamic sunset;
  final Temp? temp;
  final FeelsLike? feelsLike;
  final dynamic pressure;
  final dynamic humidity;
  final List<Weather>? weather;
  final dynamic speed;
  final dynamic deg;
  final dynamic gust;
  final dynamic clouds;
  final dynamic pop;
  final dynamic snow;

  const ForecastdaysWeatherEntity({
    this.dt,
    this.sunrise,
    this.sunset,
    this.temp,
    this.feelsLike,
    this.pressure,
    this.humidity,
    this.weather,
    this.speed,
    this.deg,
    this.gust,
    this.clouds,
    this.pop,
    this.snow,
  });

  @override
  List<Object?> get props => [
    dt,
    sunrise,
    sunset,
    temp,
    feelsLike,
    pressure,
    humidity,
    weather,
    speed,
    deg,
    gust,
    clouds,
    pop,
    snow,
  ];
}
