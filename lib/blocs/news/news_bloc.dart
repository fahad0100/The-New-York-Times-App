import 'dart:async';

import 'package:assessment2023/data/models/News.dart';
import 'package:assessment2023/data/repositories/news_repository.dart';
import 'package:assessment2023/data/services/api/Exception.dart';
import 'package:assessment2023/data/services/api/api_server.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../main.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc() : super(NewsInitial()) {
    on<Fetch1days>(read1days);
    on<Fetch7days>(read7days);
    on<Fetch30days>(read30days);
  }

  FutureOr<void> read1days(Fetch1days path, Emitter<NewsState> emit) async {
    emit(NewsLoading());
    try {
      final newsData =
          await getIt.get<NewsRepository>().get7days(path: path.path);

      emit(NewsSuccess(newsData.results));
    } on Error401 catch (error) {
      emit(NewsError(error.message));
    } on Error404 catch (error) {
      emit(NewsError(error.message));
    } on ErrorConnect catch (error) {
      emit(NewsError(error.message));
    } catch (error) {
      emit(NewsError(error.toString()));
    }
  }

  //---7 days
  FutureOr<void> read7days(Fetch7days path, Emitter<NewsState> emit) async {
    emit(NewsLoading());
    try {
      final newsData =
          await getIt.get<NewsRepository>().get30Days(path: path.path);

      emit(NewsSuccess(newsData.results));
    } on Error401 catch (error) {
      emit(NewsError(error.message));
    } on Error404 catch (error) {
      emit(NewsError(error.message));
    } on ErrorConnect catch (error) {
      emit(NewsError(error.message));
    } catch (error) {
      emit(NewsError(error.toString()));
    }
  }

  //---30 days
  FutureOr<void> read30days(Fetch30days path, Emitter<NewsState> emit) async {
    emit(NewsLoading());
    try {
      final newsData =
          await getIt.get<NewsRepository>().get1day(path: path.path);

      emit(NewsSuccess(newsData.results));
    } on Error401 catch (error) {
      emit(NewsError(error.message));
    } on Error404 catch (error) {
      emit(NewsError(error.message));
    } on ErrorConnect catch (error) {
      emit(NewsError(error.message));
    } catch (error) {
      emit(NewsError(error.toString()));
    }
  }
}
