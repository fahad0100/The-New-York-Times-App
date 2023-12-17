import 'dart:async';

import 'package:assessment2023/Bloc/news/news_bloc.dart';
import 'package:assessment2023/screens/home/home_screen.dart';
import 'package:assessment2023/screens/Bookmark_screen.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';

part 'nav_bloc_event.dart';
part 'nav_bloc_state.dart';

class NavBlocBloc extends Bloc<NavBlocEvent, NavBlocState> {
  final List<Widget> screen = [HomeScreen(), BookMarkScreen()];

  NavBlocBloc() : super(NavBlocInitial()) {
    on<ChangeEvent>(changeNav);
  }

  FutureOr<void> changeNav(ChangeEvent event, Emitter<NavBlocState> emit) {
    emit(SuccessState(index: event.index));
  }
}
