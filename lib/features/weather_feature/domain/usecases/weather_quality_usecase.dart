import 'package:sky_weather/core/resources/data_state.dart';
import 'package:sky_weather/core/usecase/usecase.dart';
import 'package:sky_weather/features/weather_feature/domain/entities/weather_quality_entity.dart';
import 'package:sky_weather/features/weather_feature/domain/repositories/weather_repository.dart';

class WeatherQualityUsecase
    extends Usecase<DataState<WeatherQualityEntity>, String> {
  final WeatherRepository weatherRepository;

  WeatherQualityUsecase(this.weatherRepository);

  //? get current weather usecase
  @override
  Future<DataState<WeatherQualityEntity>> call(String params) {
    return weatherRepository.fetchWeatherQualityData(params);
  }
}
