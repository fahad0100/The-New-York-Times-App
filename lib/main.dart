import 'package:assessment2023/data/services/api/api_server.dart';
import 'package:assessment2023/data/repositories/news_repository.dart';
import 'package:assessment2023/UI/screens/MainApp.dart';
import 'package:assessment2023/utils/constants/api_constants.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  setup();
  runApp(const MainApp());
}

void setup() {
  getIt.registerSingleton<NewsRepository>(NewsRepository());
  getIt.registerSingleton<ApiServer>(ApiServer());
  getIt.registerSingleton<ApiConstants>(ApiConstants());
}
