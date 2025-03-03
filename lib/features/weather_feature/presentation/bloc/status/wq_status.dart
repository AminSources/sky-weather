import 'package:flutter/material.dart';
import 'package:sky_weather/features/weather_feature/domain/entities/weather_quality_entity.dart';

@immutable
abstract class WqStatus {}

class WqCompleted extends WqStatus {
  final WeatherQualityEntity weatherQualityEntity;

  WqCompleted(this.weatherQualityEntity);
}

class WqLoading extends WqStatus {}

class WqError extends WqStatus {
  final String message;

  WqError(this.message);
}
