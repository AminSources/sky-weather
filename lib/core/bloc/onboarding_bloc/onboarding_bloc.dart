import 'package:bloc/bloc.dart';

part 'onboarding_event.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, int> {
  OnboardingBloc() : super(0) {
    //? change page event handler
    on<OnboardingChangePageEvent>(_onChangePage);
  }

  //? change page func
  void _onChangePage(event, emit) {
    if (state < 2) {
      emit(state + 1);
    }
  }
}
