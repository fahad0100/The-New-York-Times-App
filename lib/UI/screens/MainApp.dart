import 'package:assessment2023/Routes/AppRoute.dart';
import 'package:assessment2023/blocs/news/news_bloc.dart';
import 'package:assessment2023/UI/screens/home_screen.dart';
import 'package:assessment2023/blocs/themeBloc/theme_bloc.dart';
import 'package:assessment2023/utils/CustomTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => NewsBloc(),
        ),
        BlocProvider(
          create: (BuildContext context) => ThemeBloc(),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(builder: (context, state) {
        return MaterialApp(
          title: 'My App',
          theme: state is DarkTheme
              ? CustomTheme.darkTheme
              : CustomTheme.lightTheme,
          home: HomeScreen(),
          routes: AppPages.routes,
          debugShowCheckedModeBanner: false,
        );
      }),
    );
  }
}
