part of 'news_bloc.dart';

@immutable
sealed class NewsEvent {}

final class ReloadNewsEvent extends NewsEvent {}

final class ChangeProvidesEvent extends NewsEvent {
  final int index;
  ChangeProvidesEvent({required this.index});
}

final class ChangeProvidesPeriod extends NewsEvent {
  final int index;
  ChangeProvidesPeriod({required this.index});
}
