import 'package:equatable/equatable.dart';
import 'package:sky_weather/features/weather_feature/data/models/weather_quality_model.dart';

class WeatherQualityEntity extends Equatable {
  final Data? data;

  const WeatherQualityEntity({this.data});

  @override
  List<Object?> get props => [];
}
