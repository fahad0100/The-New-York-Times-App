import 'package:assessment2023/UI/screens/home_screen.dart';
import 'package:assessment2023/UI/screens/news_screen.dart';
import 'package:flutter/material.dart';

abstract class AppRoute {
  AppRoute._();
  static const home = _Paths.home;
  static const newsScreen = _Paths.newsScreen;
}

class AppPages {
  AppPages._();

  static Map<String, Widget Function(BuildContext)> routes = {
    AppRoute.home: (context) => const HomeScreen(),
    AppRoute.newsScreen: (context) =>const NewsScreen(),
  };
}

abstract class _Paths {
  _Paths._();
  static const home = '/home';
  static const newsScreen = '/newsScreen';
}
