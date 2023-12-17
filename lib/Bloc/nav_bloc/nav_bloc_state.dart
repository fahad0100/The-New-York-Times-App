part of 'nav_bloc_bloc.dart';

@immutable
sealed class NavBlocState {}

final class NavBlocInitial extends NavBlocState {}

final class SuccessState extends NavBlocState {
  final int index;
  SuccessState({required this.index});
}
