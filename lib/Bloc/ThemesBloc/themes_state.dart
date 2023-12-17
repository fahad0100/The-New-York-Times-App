part of 'themes_bloc.dart';

@immutable
sealed class ThemesState {}

final class ThemesInitial extends ThemesState {}

final class DarkModeState extends ThemesState {}
