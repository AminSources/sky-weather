part of 'check_update_bloc.dart';

class CheckUpdateState {
  CuStatus cuStatus;

  CheckUpdateState({required this.cuStatus});

  CheckUpdateState copyWith({CuStatus? newCuState}) {
    return CheckUpdateState(cuStatus: newCuState ?? cuStatus);
  }
}
