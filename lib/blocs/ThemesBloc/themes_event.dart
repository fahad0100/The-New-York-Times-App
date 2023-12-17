part of 'themes_bloc.dart';

@immutable
sealed class ThemesEvent {}

final class ChangeStateEvent extends ThemesEvent {}
