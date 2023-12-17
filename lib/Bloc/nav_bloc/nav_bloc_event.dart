part of 'nav_bloc_bloc.dart';

@immutable
sealed class NavBlocEvent {}

final class ChangeEvent extends NavBlocEvent {
  final int index;
  ChangeEvent({required this.index});
}
