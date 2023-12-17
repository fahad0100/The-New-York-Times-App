import 'dart:async';

import 'package:assessment2023/main.dart';
import 'package:bloc/bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:meta/meta.dart';
import 'package:assessment2023/utils/helper/ThemeHelper.dart';

part 'themes_event.dart';
part 'themes_state.dart';

class ThemesBloc extends Bloc<ThemesEvent, ThemesState> {
  ThemesBloc() : super(ThemesInitial()) {

    on<ChangeStateEvent>(changeTheme);
  }

  FutureOr<void> changeTheme(
      ChangeStateEvent event, Emitter<ThemesState> emit) async {
    final box = GetStorage();

    await getIt<ThemeHelper>().update(isDark: !(await box.read("isDark")));
    emit(DarkModeState());
  }
}
