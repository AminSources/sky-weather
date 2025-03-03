import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sky_weather/core/params/no_param.dart';
import 'package:sky_weather/core/resources/data_state.dart';
import 'package:sky_weather/features/check_update_feature/domain/usecases/check_update_usecase.dart';
import 'package:sky_weather/features/check_update_feature/presentation/bloc/status/cu_status.dart';

part 'check_update_event.dart';
part 'check_update_state.dart';

class CheckUpdateBloc extends Bloc<CheckUpdateEvent, CheckUpdateState> {
  final CheckUpdateUsecase checkUpdateUsecase;
  CheckUpdateBloc(this.checkUpdateUsecase)
    : super(CheckUpdateState(cuStatus: CuLoading())) {
    //? load cu event handler
    on<LoadCuEvent>(_onLoadCuEvent);
  }

  //? load cu event func
  void _onLoadCuEvent(event, emit) async {
    //* set state on loading state
    emit(state.copyWith(newCuState: CuLoading()));

    //* params
    NoParam noParam = NoParam();

    //* call check update usecase
    DataState dataState = await checkUpdateUsecase(noParam);

    if (dataState is DataSuccess) {
      emit(state.copyWith(newCuState: CuCompleted(dataState.data)));
    } else if (dataState is DataError) {
      emit(state.copyWith(newCuState: CuError(dataState.error!)));
    }
  }
}
