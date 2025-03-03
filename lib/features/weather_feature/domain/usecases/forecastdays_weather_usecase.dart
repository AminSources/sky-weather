import 'package:sky_weather/core/resources/data_state.dart';
import 'package:sky_weather/core/usecase/usecase.dart';
import 'package:sky_weather/features/weather_feature/domain/entities/forecastdays_weather_entity.dart';
import 'package:sky_weather/features/weather_feature/domain/repositories/weather_repository.dart';

class ForecastdaysWeatherUsecase
    extends Usecase<DataState<List<ForecastdaysWeatherEntity>>, String> {
  final WeatherRepository weatherRepository;

  ForecastdaysWeatherUsecase(this.weatherRepository);

  //? get current weather usecase
  @override
  Future<DataState<List<ForecastdaysWeatherEntity>>> call(String params) {
    return weatherRepository.fetchForecastdaysWeatherData(params);
  }
}
