part of 'weather_bloc.dart';

sealed class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

//? load current weather event
class LoadCwEvent extends WeatherEvent {
  final String cityName;

  const LoadCwEvent(this.cityName);
}

//? load forecast weather event
class LoadFwEvent extends WeatherEvent {
  final String cityName;

  const LoadFwEvent(this.cityName);
}

//? load weather quality event
class LoadWqEvent extends WeatherEvent {
  final String cityName;

  const LoadWqEvent(this.cityName);
}
