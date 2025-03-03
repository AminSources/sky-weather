import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_storage/get_storage.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState(false)) {
    //? on change theme event
    on<ChangeThemeEvent>(_onChangeTheme);
  }

  //? on change theme func
  void _onChangeTheme(event, emit) {
    //* toggle theme
    emit(ThemeState(event.isDark));

    //* save theme state
    GetStorage().write("theme", event.isDark);
  }
}
