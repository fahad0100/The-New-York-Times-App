import 'package:assessment2023/Bloc/ThemesBloc/themes_bloc.dart';
import 'package:assessment2023/data/models/news_model.dart';
import 'package:assessment2023/screens/home/widgets/segment_label.dart';
import 'package:assessment2023/utils/helper/ThemeHelper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:assessment2023/screens/home/widgets/card_news.dart';
import 'package:get_it/get_it.dart';

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

final newsModel = NewsModel.fromJson({
  "uri": "nyt://article/926604c5-20f3-5a51-97a6-fb2a77293624",
  "url":
      "https://www.nytimes.com/2023/12/14/well/live/iud-insertion-pain-relief.html",
  "id": 100000009213269,
  "asset_id": 100000009213269,
  "source": "New York Times",
  "published_date": "2023-12-14",
  "updated": "2023-12-14 12:02:21",
  "section": "Well",
  "subsection": "Live",
  "nytdsection": "well",
  "adx_keywords":
      "Birth Control and Family Planning;Gynecology and Gynecologists;Pain;Social Media;Pain-Relieving Drugs",
  "column": null,
  "byline": "By Alisha Haridasani Gupta",
  "type": "Article",
  "title": "Getting an IUD Hurts. Why Aren’t More Women Offered Relief?",
  "abstract":
      "One of the most effective birth control options is also known for the excruciatingly painful procedure to insert it.",
  "des_facet": [
    "Birth Control and Family Planning",
    "Gynecology and Gynecologists",
    "Pain",
    "Social Media",
    "Pain-Relieving Drugs"
  ],
  "org_facet": [],
  "per_facet": [],
  "geo_facet": [],
  "media": [
    {
      "type": "image",
      "subtype": "photo",
      "caption": "",
      "copyright": "Sara Andreasson",
      "approved_for_syndication": 1,
      "media-metadata": [
        {
          "url":
              "https://static01.nyt.com/images/2023/12/19/well/14Well-IUD-Pain/14Well-IUD-Pain-thumbStandard.jpg",
          "format": "Standard Thumbnail",
          "height": 75,
          "width": 75
        },
        {
          "url":
              "https://static01.nyt.com/images/2023/12/19/well/14Well-IUD-Pain/14Well-IUD-Pain-mediumThreeByTwo210.jpg",
          "format": "mediumThreeByTwo210",
          "height": 140,
          "width": 210
        },
        {
          "url":
              "https://static01.nyt.com/images/2023/12/19/well/14Well-IUD-Pain/14Well-IUD-Pain-mediumThreeByTwo440.jpg",
          "format": "mediumThreeByTwo440",
          "height": 293,
          "width": 440
        }
      ]
    }
  ],
  "eta_id": 0
});
