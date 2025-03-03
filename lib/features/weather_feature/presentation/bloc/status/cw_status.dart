import 'package:flutter/material.dart';
import 'package:sky_weather/features/weather_feature/domain/entities/current_weather_entity.dart';

@immutable
abstract class CwStatus {}

class CwCompleted extends CwStatus {
  final CurrentWeatherEntity currentWeatherEntity;

  CwCompleted(this.currentWeatherEntity);
}

class CwLoading extends CwStatus {}

class CwError extends CwStatus {
  final String message;

  CwError(this.message);
}
