import 'dart:async';

import 'package:assessment2023/main.dart';
import 'package:assessment2023/data/models/news_model.dart';

import 'package:assessment2023/data/provider/news_provider.dart';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  int selectedProvides = 0;
  int selectedPeriod = 0;
  NewsBloc() : super(NewsInitial()) {
    on<ReloadNewsEvent>(loadNews);
    on<ChangeProvidesEvent>(changeProvides);
    on<ChangeProvidesPeriod>(changePeriod);
  }

  FutureOr<void> loadNews(
      ReloadNewsEvent event, Emitter<NewsState> emit) async {
    try {
      emit(LoadingReloadState());
      final dataNews = await getIt.get<NewsProvider>().readData();
      emit(SuccessReloadState(dataNews: dataNews));
    } on FormatException catch (error) {
      emit(ErrorReloadState(error: error.message));
    } catch (error) {
      emit(ErrorReloadState(error: error.toString()));
    }
  }

  FutureOr<void> changeProvides(
      ChangeProvidesEvent event, Emitter<NewsState> emit) async {
    try {
      selectedProvides = event.index;
      emit(ChangeLabelState());
      emit(LoadingReloadState());
      final dataNews = await getIt.get<NewsProvider>().readData(
          provide: _getValueSelectedProvides(index: event.index),
          period: _getValueSelectedPeriod(index: selectedPeriod));
      emit(SuccessReloadState(dataNews: dataNews));
    } on FormatException catch (error) {
      emit(ErrorReloadState(error: error.message));
    } catch (error) {
      emit(ErrorReloadState(error: error.toString()));
    }
  }

  FutureOr<void> changePeriod(
      ChangeProvidesPeriod event, Emitter<NewsState> emit) async {
    try {
      selectedPeriod = event.index;
      emit(ChangeLabelState());
      emit(LoadingReloadState());
      final dataNews = await getIt.get<NewsProvider>().readData(
          provide: _getValueSelectedProvides(index: selectedProvides),
          period: _getValueSelectedPeriod(index: event.index));
      emit(SuccessReloadState(dataNews: dataNews));
    } on FormatException catch (error) {
      emit(ErrorReloadState(error: error.message));
    } catch (error) {
      emit(ErrorReloadState(error: error.toString()));
    }
  }
}

ProvidesEnum _getValueSelectedProvides({required int index}) {
  switch (index) {
    case 0:
      return ProvidesEnum.emailed;
    case 1:
      return ProvidesEnum.shared;
    case 2:
      return ProvidesEnum.emailed;
    default:
      return ProvidesEnum.emailed;
  }
}

PeriodEnum _getValueSelectedPeriod({required int index}) {
  switch (index) {
    case 0:
      return PeriodEnum.oneDay;
    case 1:
      return PeriodEnum.sevenDays;
    case 2:
      return PeriodEnum.thirtyDays;
    default:
      return PeriodEnum.oneDay;
  }
}
