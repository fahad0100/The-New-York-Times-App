import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.teal,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.grey.withOpacity(0.5),
      elevation: 0,
    ),
    progressIndicatorTheme:
        const ProgressIndicatorThemeData(color: Colors.black),
    scaffoldBackgroundColor: Colors.white,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(foregroundColor: Colors.white),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.teal,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.blue[900],
      elevation: 0,
    ),
    progressIndicatorTheme:
        const ProgressIndicatorThemeData(color: Colors.white),
    scaffoldBackgroundColor: Colors.black,
  );
}
