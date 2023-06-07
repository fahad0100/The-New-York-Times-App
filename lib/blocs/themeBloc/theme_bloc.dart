import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(LightTheme()) {
    on<ChangeTheme>(read1days);
  }

  FutureOr<void> read1days(ChangeTheme _, Emitter<ThemeState> emit) {
    emit(state is LightTheme ? DarkTheme() : LightTheme());
  }
}
