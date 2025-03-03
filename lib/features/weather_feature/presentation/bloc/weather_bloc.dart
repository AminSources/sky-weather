import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sky_weather/core/resources/data_state.dart';
import 'package:sky_weather/features/weather_feature/domain/usecases/current_weather_usecase.dart';
import 'package:sky_weather/features/weather_feature/domain/usecases/forecastdays_weather_usecase.dart';
import 'package:sky_weather/features/weather_feature/domain/usecases/weather_quality_usecase.dart';
import 'package:sky_weather/features/weather_feature/presentation/bloc/status/cw_status.dart';
import 'package:sky_weather/features/weather_feature/presentation/bloc/status/fw_status.dart';
import 'package:sky_weather/features/weather_feature/presentation/bloc/status/wq_status.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final CurrentWeatherUsecase currentWeatherUsecase;
  final ForecastdaysWeatherUsecase forecastdaysWeatherUsecase;
  final WeatherQualityUsecase weatherQualityUsecase;
  WeatherBloc(
    this.currentWeatherUsecase,
    this.forecastdaysWeatherUsecase,
    this.weatherQualityUsecase,
  ) : super(
        WeatherState(
          cwStatus: CwLoading(),
          fwStatus: FwLoading(),
          wqStatus: WqLoading(),
        ),
      ) {
    //? load cw event handler
    on<LoadCwEvent>(_onCwEventLoading);

    //? load fw event handler
    on<LoadFwEvent>(_onFwEventLoading);

    //? load wq event handler
    on<LoadWqEvent>(_onWqEventLoading);
  }

  //? load cw event func
  void _onCwEventLoading(event, emit) async {
    //* set state on loading state
    emit(state.copyWith(newCwStatus: CwLoading()));

    //* call current weather usecase
    DataState dataState = await currentWeatherUsecase(event.cityName);

    if (dataState is DataSuccess) {
      emit(state.copyWith(newCwStatus: CwCompleted(dataState.data)));
    } else if (dataState is DataError) {
      emit(state.copyWith(newCwStatus: CwError(dataState.error!)));
    }
  }

  //? laod fw event func
  void _onFwEventLoading(event, emit) async {
    //* set state on loading state
    emit(state.copyWith(newFwStatus: FwLoading()));

    //* call forecastdays weather usecase
    DataState dataState = await forecastdaysWeatherUsecase(event.cityName);

    if (dataState is DataSuccess) {
      emit(state.copyWith(newFwStatus: FwCompleted(dataState.data)));
    } else if (dataState is DataError) {
      emit(state.copyWith(newFwStatus: FwError(dataState.error!)));
    }
  }

  //? load wq event func
  void _onWqEventLoading(event, emit) async {
    //* set state on loading state
    emit(state.copyWith(newWqStatus: WqLoading()));

    //* call weather quality usecase
    DataState dataState = await weatherQualityUsecase(event.cityName);

    if (dataState is DataSuccess) {
      emit(state.copyWith(newWqStatus: WqCompleted(dataState.data)));
    } else if (dataState is DataError) {
      emit(state.copyWith(newWqStatus: WqError(dataState.error!)));
    }
  }
}
