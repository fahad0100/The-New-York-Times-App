# The New York Times App

This is a Flutter application that allows you to read news from The New York Times. It is built using Flutter and utilizes various libraries and tools for state management, API integration, routing, and more.


## Project Demo

Demo app at the following link:

[Demo App](https://github.com/fahad0100/The-New-York-Times-App/assets/41303127/529b5b8a-bf55-4bfe-b651-65d2bc3b3e2b)

Please feel free to explore the app and provide any feedback or suggestions. I appreciate your time and consideration.


## How to Use

### Step 1:
Download or clone this repo by using the link below:
```
https://github.com/fahad0100/The-New-York-Times-App.git
```

### Step 2:
Go to the project root and execute the following command in the console to get the required dependencies:
```
flutter pub get
```

### Step 3:
Run the application using the following command:
```
flutter run
```

## Features

- Nice view
- Routing
- Connected with API
- Bloc state management
- Dependency Injection
- Dark Theme Support
- Use browser for reading news
- Dart code metrics (best practices for code)
- Unit testing

## Libraries & Tools Used

- Dio
- flutter_bloc
- get_it
- Bloc (State Management)
- url_launcher
- cached_network_image
- animated_segment
- google_fonts
- dart_code_metrics

## Folder Structure

Here is the core folder structure which Flutter provides:

```
flutter-app/
|- android/
|- build/
|- ios/
|- lib/
|- analysis_options.yaml => configuration for dart_code_metrics, make changes here
|- test/
```

Here is the folder structure used in this project:

```
lib/
|-- Bloc/
    |-- news/
        |- news_bloc.dart
        |- news_event.dart
        |- news_state.dart
    |-- themebloc/
        |- theme_bloc.dart
        |- theme_event.dart
        |- theme_state.dart
|-- data/
    |-- models/
        |- news.dart
        |- response_news.dart
    |-- repositories/
        |- news_repository.dart
    |-- services/
        |- api_server.dart
        |- exception.dart
|-- Routes/
    |- app_route.dart
|-- ui/
    |-- components/
        |-- Images/
            |- display_image_widget.dart
        |-- news/
            |- news_widget.dart
        |-- tagsWidget/
            |- facts_widget.dart
        |-- tapWidgets/
            |- menu_drop.dart
            |- segmented_tap.dart
        |-- text/
            |- text_label_widget.dart
|-- utils/
    |- home_screen.dart
    |- main_app.dart
    |- news_screen.dart
|-- utils/
    |-- constants/
        |- api_constants.dart
        |- padding_constants.dart
        |- public_variables.dart
        |- spacing_constants.dart
    |-- extensions/
        |- move_to_page.dart
        |- size_screen.dart
    |-- method/
        |- open_browser.dart
    |- custom_theme.dart
|- main.dart
```

Now, let's dive into the `lib` folder, which contains the main code for the application.

- `constants`: All the application-level constants are defined in this directory within their respective files. This directory contains constants for `theme`, `dimensions`, `API endpoints`, `preferences`, and `strings`.

- `data`: Contains the data layer of the project, including models, repositories, and API services.

- `ui`: Contains all the user interface (UI) of the project, with a subdirectory for each screen.

- `Routes`: This file contains all the routes for the project.

- `Bloc`: Contains the state management using the `flutter_bloc` library.

- `utils`: Contains utility/common functions of the application.

## Routes Code

This file contains all the routes for your application.

```dart
abstract class AppRoute {
  AppRoute._();
  static const home = _Paths.home;
  static const newsScreen = _Paths.newsScreen;
}

class AppPages {
  AppPages

._();

  static Map<String, Widget Function(BuildContext)> routes = {
    AppRoute.home: (context) => const HomeScreen(),
    AppRoute.newsScreen: (context) => const NewsScreen(),
  };
}

abstract class _Paths {
  _Paths._();
  static const home = '/home';
  static const newsScreen = '/newsScreen';
}
```

Extensions for Navigator

```dart
extension MoveToPage on BuildContext {
  push({required String nameRoute, arguments}) {
    Navigator.of(this).pushNamed(nameRoute, arguments: arguments);
  }
}
```

Extension for getting screen size

```dart
extension SizeScreen on BuildContext {
  screenSize() {
    return MediaQuery.of(this).size;
  }

  screenHeight() {
    return MediaQuery.of(this).size.height;
  }

  screenSizeDividedBy({required double divideNumber}) {
    final sizeScreen = MediaQuery.of(this).size;

    return Size(
      sizeScreen.width / divideNumber,
      sizeScreen.width / divideNumber,
    );
  }

  screenWidth() {
    return MediaQuery.of(this).size.width;
  }
}
```

Class for API (Path, base URL, and period)

```dart
class ApiConstants extends ApiBase with ApiPath {}

mixin ApiPath {
  static const String _sharedPathEmailed = "/svc/mostpopular/v2/emailed";
  static const String _sharedPathShared = "/svc/mostpopular/v2/shared";
  static const String _sharedPathViewed = "/svc/mostpopular/v2/viewed";
  static const String _period1day = "/1.json";
  static const String _period7days = "/7.json";
  static const String _period30days = "/30.json";

  String get pathEmailed {
    return _sharedPathEmailed;
  }

  String get pathShared {
    return _sharedPathShared;
  }

  String get pathViewed {
    return _sharedPathViewed;
  }

  String get period1day {
    return _period1day;
  }

  String get period7days {
    return _period7days;
  }

  String get period30days {
    return _period30days;
  }
}

mixin ApiBase {
  static const String _api = "https://api.nytimes.com";
  static const String _key = "i4AFyxF7hccijAuPbHiJnZcD1Fkpyfjv";

  String get baseURL {
    return _api;
  }

  String get key {
    return _key;
  }
}
```

News Repository

```dart
class NewsRepository {
  final dio = Dio();
  Future<ResponseNews> get1day({required PathApi path}) async {
    return await getIt
        .get<ApiServer>()
        .getNewsFromServer(periodState: Period.day1, path: path);
  }

  Future<ResponseNews> get7days({required PathApi path}) async {
    return await getIt
        .get<ApiServer>()
        .getNewsFromServer(periodState: Period.day7, path: path);
  }

  Future<ResponseNews> get30Days({required PathApi path}) async {
    return await getIt
        .get<ApiServer>()
        .getNewsFromServer(periodState: Period.day30, path: path);
  }
}
```

MainApp file

```dart
class MainApp extends StatelessWidget {
  const MainApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => NewsBloc(),
        ),
        BlocProvider(
          create

: (BuildContext context) => ThemeBloc(),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(builder: (context, state) {
        return MaterialApp(
          title: 'My App',
          theme: state is DarkTheme ? CustomTheme.darkTheme : CustomTheme.lightTheme,
          home: HomeScreen(),
          routes: AppPages.routes,
          debugShowCheckedModeBanner: false,
        );
      }),
    );
  }
}
```


# Uinit test 

### Test Api 
```dart 

import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

void main() {
  final getIt = GetIt.instance;
  getIt.registerSingleton<ApiConstants>(ApiConstants());

  group("Test For get All news", () {
    test('Test get data for 1 day', () async {
      final newsRepository = ApiServer();
      final response = await newsRepository.getNewsFromServer(
        periodState: Period.day1,
        path: PathApi.shared,
      );
      expect(response, isNotNull);
      expect(response.status, equals("OK"));
    });
  });

  test('Test get data for 7 days', () async {
    await Future.delayed(const Duration(seconds: 10));
    final newsRepository = ApiServer();
    final response = await newsRepository.getNewsFromServer(
        periodState: Period.day7, path: PathApi.viewed);
    expect(response, isNotNull);
    expect(response.status, equals("OK"));
  });

  test('Test get data for 30 days', () async {
    await Future.delayed(const Duration(seconds: 10));
    final newsRepository = ApiServer();
    final response = await newsRepository.getNewsFromServer(
        periodState: Period.day30, path: PathApi.emailed);
    expect(response, isNotNull);
    expect(response.status, equals("OK"));
  });
}
```
### Test Widgets
```dart



void main() {
  group("Test SegmentedTap widget", () {
    testWidgets(
      'SegmentedTap displays correct segments',
      (WidgetTester tester) async {
        // Build SegmentedTap with the desired selected period
        Period selectedPeriod = Period.day7;
        await tester.pumpWidget(MaterialApp(
          home: Scaffold(
            body: ListView(
              children: [
                SegmentedTap(
                  selected: selectedPeriod,
                  onSelectionChange: (selected) {
                    selectedPeriod = selected.first;
                  },
                ),
              ],
            ),
          ),
        ));
        expect(find.text('1 Day'), findsOneWidget);
        expect(find.text('7 Days'), findsOneWidget);
        expect(find.text('30 Days'), findsOneWidget);
        expect(find.byIcon(Icons.segment_outlined), findsOneWidget);
        await tester.tap(find.text('30 Days'));
        await tester.pump();
        expect(selectedPeriod, equals(Period.day30));
      },
    );
    //-----
    testWidgets('Test MenuDrop widget', (WidgetTester tester) async {
      String value = 'Emailed';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MenuDrop(
              value: value,
              onChanged: (newValue) {
                value = newValue!;
              },
            ),
          ),
        ),
      );

      //--------
      expect(find.text('Emailed'), findsOneWidget);
      await tester.tap(find.text('Emailed'));
      await tester.pump();
      await tester.tap(find.text('Viewed'));
      await tester.pump();
      expect(value, equals("Viewed"));
      //---Step 2
      expect(find.text('Emailed'), findsOneWidget);
      await tester.tap(find.text('Emailed'));
      await tester.pump();
      await tester.tap(find.text('Shared'));
      await tester.pump();
      expect(value, equals("Shared"));
    });
  });
}
```

This README file provides an overview of the project structure, features, and instructions on how to use the application. For more details, please refer to the source code in the repository.
