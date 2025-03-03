import 'package:sky_weather/core/resources/data_state.dart';
import 'package:sky_weather/core/usecase/usecase.dart';
import 'package:sky_weather/features/weather_feature/domain/entities/current_weather_entity.dart';
import 'package:sky_weather/features/weather_feature/domain/repositories/weather_repository.dart';

class CurrentWeatherUsecase
    extends Usecase<DataState<CurrentWeatherEntity>, String> {
  final WeatherRepository weatherRepository;
  CurrentWeatherUsecase(this.weatherRepository);

  //? get current weather usecase
  @override
  Future<DataState<CurrentWeatherEntity>> call(String params) {
    return weatherRepository.fetchCurrentWeatherData(params);
  }
}
