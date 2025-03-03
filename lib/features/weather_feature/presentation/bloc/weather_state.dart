part of 'weather_bloc.dart';

class WeatherState {
  CwStatus cwStatus;
  FwStatus fwStatus;
  WqStatus wqStatus;

  WeatherState({
    required this.cwStatus,
    required this.fwStatus,
    required this.wqStatus,
  });

  WeatherState copyWith({
    CwStatus? newCwStatus,
    FwStatus? newFwStatus,
    WqStatus? newWqStatus,
  }) {
    return WeatherState(
      cwStatus: newCwStatus ?? cwStatus,
      fwStatus: newFwStatus ?? fwStatus,
      wqStatus: newWqStatus ?? wqStatus,
    );
  }
}
