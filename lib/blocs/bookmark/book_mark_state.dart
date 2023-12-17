part of 'book_mark_bloc.dart';

@immutable
sealed class BookMarkState {}

final class BookMarkInitial extends BookMarkState {}

final class SuccessState extends BookMarkState {
  final List<NewsModel>? dataNews;
  SuccessState({this.dataNews});
}
