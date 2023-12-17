part of 'book_mark_bloc.dart';

@immutable
sealed class BookMarkEvent {}

final class LoadBookMarkEvent extends BookMarkEvent {}

final class SaveMarkEvent extends BookMarkEvent {}
