import 'package:assessment2023/Blocs/ThemesBloc/themes_bloc.dart';
import 'package:assessment2023/Blocs/bookmark/book_mark_bloc.dart';
import 'package:assessment2023/Blocs/nav_bloc/nav_bloc_bloc.dart';
import 'package:assessment2023/Blocs/news/news_bloc.dart';
import 'package:assessment2023/screens/display_news/display_news.dart';
import 'package:assessment2023/screens/home/home_screen.dart';
import 'package:assessment2023/screens/nav_screen.dart';
import 'package:assessment2023/utils/helper/setup_get_It.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:assessment2023/utils/helper/ThemeHelper.dart';

final getIt = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage().initStorage;

  await setupGetIt();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemesBloc(),
        ),
        BlocProvider(
          create: (context) => NewsBloc()..add(ReloadNewsEvent()),
        ),
        BlocProvider(
          create: (context) => NavBlocBloc()..add(ChangeEvent(index: 0)),
        ),
        BlocProvider(
          create: (context) => BookMarkBloc()..add(LoadBookMarkEvent()),
        ),
      ],
      child: BlocBuilder<ThemesBloc, ThemesState>(
        buildWhen: (_, newState) {
          return true;
        },
        builder: (context, state) {
          return MaterialApp(
            darkTheme: ThemeData(
              brightness: Brightness.dark,
            ),
            theme: ThemeData(
                brightness: Brightness.light,
                scaffoldBackgroundColor: Color(0xffFFFBFB)),
            themeMode: getIt.get<ThemeHelper>().isDark
                ? ThemeMode.dark
                : ThemeMode.light,
            initialRoute: '/nav',
            routes: {
              "/home": (context) => HomeScreen(),
              "/display_news": (context) => DisplayNewsScreen(),
              "/nav": (context) => NavScreen(),
            },
          );
        },
      ),
    );
  }
}
