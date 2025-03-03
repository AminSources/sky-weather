import 'package:flutter/material.dart';
import 'package:sky_weather/features/weather_feature/domain/entities/forecastdays_weather_entity.dart';

@immutable
abstract class FwStatus {}

class FwCompleted extends FwStatus {
  final List<ForecastdaysWeatherEntity> forecastdaysWeatherEntity;

  FwCompleted(this.forecastdaysWeatherEntity);
}

class FwLoading extends FwStatus {}

class FwError extends FwStatus {
  final String message;

  FwError(this.message);
}
