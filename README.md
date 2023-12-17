# The New York Times App

This is a Flutter application that allows you to read news from The New York Times. It is built using Flutter and utilizes various libraries and tools for state management, API integration, routing, and more.


## Project Demo

Demo app at the following link:

[Demo App](https://github.com/fahad0100/The-New-York-Times-App/assets/41303127/63ad6d13-70c9-4b38-b799-dba89ee9a06b)


## How to Use

### Step 1:
Download or clone this repo by using the link below:
```
get clone https://github.com/fahad0100/The-New-York-Times-App.git
```

### Step 2:
Go to the folder name The-New-York-Times-App
```
fcd The-New-York-Times-App/
```

### Step 3:
in the project root add .env file:
```
.env
```

### Step 4:
add inside .env your api key as
```
key = "api-key"
```

### Step 5:
execute the following command in the console to get the required dependencies:
```
flutter pub get
```

### Step 6:
Run the application using the following command:
```
flutter run
```

## Features

- Nice view
- Connected with API
- Bloc state management
- Dependency Injection
- Dark Theme Support
- Use browser for reading news
- Unit testing

## Libraries & Tools Used

- Dio
- flutter_bloc
- get_it
- Bloc (State Management)
- url_launcher

## Folder Structure

Here is the core folder structure which Flutter provides:

```
flutter-app/
|- android/
|- ios/
|- lib/
|- test/
```

Here is the folder structure used in this project:

```
lib/
|-- blocs/
    |-- bookmark/
        |- book_mark_bloc.dart
        |- book_mark_event.dart
        |- book_mark_state.dart
    |-- nav_bloc/
        |- nav_bloc_bloc.dart
        |- nav_bloc_event.dart
        |- nav_bloc_state.dart
    |-- news/
        |- news_bloc.dart
        |- news_event.dart
        |- news_state.dart
    |-- ThemesBloc/
        |- themes_bloc.dart
        |- themes_event.dart
        |- themes_state.dart
|-- data/
    |-- models/
        |- news_model.dart
    |-- provider/
        |- ApiConsent.dart
        |- news_provider.dart
|-- screens/
    |-- display_news/
        |-- widgets/
            |- ByAuthorWidget.dart
        |- display_news.dart
    |-- home/
        |-- widgets/
            |- card_news.dart
            |- date_widget.dart
            |- segment_label.dart
            |- text_label.dart
            |- wrap_DesFacet_widget.dart
        |- home_screen.dart
    |-- widgets/
        |-- widgets/
            |- Button_custom.dart
            |- image_display.dart
            |- switch_mod_widget.dart
        |- bookmark_screen.dart
        |- nav_screen.dart
|-- utils/
    |-- extensions/
        |- move_view.dart
        |- screen_size.dart
    |-- helper/
        |- add_to_bookmark.dart
        |- check_dark_mode.dart
        |- check_if_in_bookmark.dart
        |- layout.dart
        |- openURL.dart
        |- remove_from_bookmark.dart
        |- setup_get_It.dart
        |- ThemeHelper.dart
|- main.dart
```

Now, let's dive into the `lib` folder, which contains the main code for the application.

- `data`: Contains the data layer of the project, including models, repositories, and API services.

- `screens`: Contains all the user interface (UI) of the project, with a subdirectory for each screen.

- `Bloc`: Contains the state management using the `flutter_bloc` library.

- `utils`: Contains utility/common functions of the application.



## Extensions for Navigator

```dart
extension Nav on BuildContext {
  push({required String nameScreen, Object? arguments}) {
    return Navigator.pushNamed(this, nameScreen, arguments: arguments);
  }

  pushAndRemoveUntil({required String nameScreen, Object? arguments}) {
    return Navigator.pushNamedAndRemoveUntil(
        this, nameScreen, ModalRoute.withName('/'),
        arguments: arguments);
  }
}




```

## Extension for getting screen size

```dart
extension ScreenSize on BuildContext {
double  getWidth({double? divide = 1}) {
    return MediaQuery.of(this).size.width / divide!;
  }

 double getHeight({double? divide = 1}) {
    return MediaQuery.of(this).size.height / divide!;
  }
}
```



## News provider
```dart

class NewsProvider {
  Future<List<NewsModel>> readData(
      {ProvidesEnum provide = ProvidesEnum.emailed,
      PeriodEnum period = PeriodEnum.thirtyDays}) async {
    final dio = Dio();
    final ApiConsent consentApi = ApiConsent();
    late String endPointProvide;
    late String endPointPeriod;
    switch (provide) {
      case ProvidesEnum.emailed:
        endPointProvide = consentApi.emailed;
        break;
      case ProvidesEnum.shared:
        endPointProvide = consentApi.shared;
        break;
      case ProvidesEnum.viewed:
        endPointProvide = consentApi.viewed;

        break;
      default:
        endPointProvide = consentApi.emailed;
    }
    switch (period) {
      case PeriodEnum.oneDay:
        endPointPeriod = consentApi.oneDay;
        break;
      case PeriodEnum.sevenDays:
        endPointPeriod = consentApi.sevenDays;
        break;
      case PeriodEnum.thirtyDays:
        endPointPeriod = consentApi.thirtyDays;

        break;
      default:
        endPointProvide = consentApi.thirtyDays;
    }

    try {
      await dotenv.load(fileName: ".env");
      final response = await dio.get(
          '${consentApi.api}$endPointProvide$endPointPeriod?api-key=${dotenv.env['key']}');
      List<NewsModel> newsList = (response.data["results"] as List)
          .map((e) => NewsModel.fromJson(e))
          .toList();

      return newsList;
    } on DioException catch (error) {
      print(error.response?.statusMessage);
      throw FormatException(error.response!.statusMessage!);
    } catch (error) {
      print(error);
      throw FormatException("There is an error that is not defined");
    }
  }
}

```

MainApp file

```dart
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
```


# Uinit test 

### Test Api 
```dart 

void main() {
  group('Api test', () {
    test('readData should return a list of NewsModel', () async {
      final newsProvider = NewsProvider();
      final newsList = await newsProvider.readData();
      expect(newsList, isNotEmpty);
      expect(newsList, isA<List<NewsModel>>());
    });
  });
}

```
### Test Widgets
```dart
void main() async {
  group("Test Widgets ", () {
    testWidgets('renders CardNews widget', (WidgetTester tester) async {
      final getIt = GetIt.instance;
      getIt.registerSingleton<ThemeHelper>(ThemeHelper(isDark: false));
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => ThemesBloc(),
          child: MaterialApp(
              home: Scaffold(
            body: CardNews(
              size: 200,
              objectNews: newsModel,
              isBookmark: false,
              onTap: () {},
              onBookmark: () {},
              onShear: () {},
            ),
          )),
        ),
      );

      expect(find.byType(CardNews), findsOneWidget);
      expect(
          find.text(
              'Getting an IUD Hurts. Why Aren’t More Women Offered Relief?'),
          findsOneWidget);
    });
  });
  testWidgets('renders SegmentLabel widget', (WidgetTester tester) async {
    // Pump the widget tree
    await tester.pumpWidget(
      MaterialApp(
          home: Scaffold(
        body: SegmentLabel(
            currentIndex: 0,
            items: ["Emailed", "Shearing", "Email"],
            onTap: (index) {}),
      )),
    );

    // Verify: Ensure that the CardNews widget is rendered
    expect(find.byType(SegmentLabel), findsOneWidget);
    expect(find.text('Emailed'), findsOneWidget);
    expect(find.text('Shearing'), findsOneWidget);
    expect(find.text('Email'), findsOneWidget);

    // Add more assertions as needed
  });
  testWidgets('renders CardNews and SegmentLabel widgets',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      BlocProvider(
        create: (context) => ThemesBloc(),
        child: MaterialApp(
            home: Scaffold(
          body: Column(
            children: [
              SegmentLabel(
                  currentIndex: 0,
                  items: ["Emailed", "Shearing", "Email"],
                  onTap: (index) {}),
              CardNews(
                size: 200,
                objectNews: newsModel,
                isBookmark: false,
                onTap: () {},
                onBookmark: () {},
                onShear: () {},
              ),
            ],
          ),
        )),
      ),
    );

    expect(find.byType(SegmentLabel), findsOneWidget);
    expect(find.text('Emailed'), findsOneWidget);
    expect(find.text('Shearing'), findsOneWidget);
    expect(find.text('Email'), findsOneWidget);
    expect(find.byType(CardNews), findsOneWidget);
    expect(
        find.text(
            'Getting an IUD Hurts. Why Aren’t More Women Offered Relief?'),
        findsOneWidget);
  });
}
```

This README file provides an overview of the project structure, features, and instructions on how to use the application. For more details, please refer to the source code in the repository.
