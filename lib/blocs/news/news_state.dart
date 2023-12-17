part of 'news_bloc.dart';

@immutable
sealed class NewsState {}

final class NewsInitial extends NewsState {}

final class LoadingReloadState extends NewsState {}

final class SuccessReloadState extends NewsState {
  final List<NewsModel> dataNews;
  SuccessReloadState({required this.dataNews});
}

final class ErrorReloadState extends NewsState {
  final String error;
  ErrorReloadState({required this.error});
}

final class ChangeLabelState extends NewsState {}
