part of 'news_bloc.dart';

@immutable
abstract class NewsEvent {}

class Fetch1days extends NewsEvent {
  final PathApi path;
  Fetch1days(this.path);
}

class Fetch7days extends NewsEvent {
  final PathApi path;
  Fetch7days(this.path);
}

class Fetch30days extends NewsEvent {
  final PathApi path;
  Fetch30days(this.path);
}
