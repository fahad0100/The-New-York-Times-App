import 'package:assessment2023/Routes/app_route.dart';
import 'package:assessment2023/UI/components/News/NewsWidget.dart';
import 'package:assessment2023/UI/components/tapWidgets/MenuDrop.dart';
import 'package:assessment2023/UI/components/tapWidgets/SegmentedTap.dart';
import 'package:assessment2023/UI/components/Text/Text_label_widget.dart';
import 'package:assessment2023/blocs/news/news_bloc.dart';
import 'package:assessment2023/blocs/themeBloc/theme_bloc.dart';
import 'package:assessment2023/data/services/api/api_server.dart';
import 'package:assessment2023/utils/constants/public_variables.dart';
import 'package:assessment2023/utils/extensions/MoveToPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  Period indexSegment = Period.day1;
  late TabController controller;
  String dropdownValue = 'Emailed';
  PathApi pathApi = PathApi.emailed;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<NewsBloc>().add(Fetch1days(PathApi.emailed));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: MenuDrop(
          value: dropdownValue,
          onChanged: (String? newValue) {
            setState(() {
              dropdownValue = newValue!;
              switch (dropdownValue) {
                case "Emailed":
                  pathApi = PathApi.emailed;
                  break;
                case "Shared":
                  pathApi = PathApi.shared;
                  break;
                case "Viewed":
                  pathApi = PathApi.viewed;
                  break;

                default:
                  pathApi = PathApi.emailed;
              }
              indexSegment = Period.day1;
              context.read<NewsBloc>().add(Fetch1days(pathApi));
            });
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.read<ThemeBloc>().add(ChangeTheme());
            },
            icon: BlocBuilder<ThemeBloc, ThemeState>(builder: (context, state) {
              if (state is LightTheme) {
                return Icon(Icons.dark_mode);
              }
              if (state is DarkTheme) {
                return Icon(Icons.light);
              }
              return Icon(Icons.light);
            }),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: [
            SegmentedTap(
              selected: indexSegment,
              onSelectionChange: (index) {
                setState(() {
                  indexSegment = index.first;
                  switch (indexSegment) {
                    case Period.day1:
                      context.read<NewsBloc>().add(Fetch1days(pathApi));
                      break;
                    case Period.day7:
                      context.read<NewsBloc>().add(Fetch7days(pathApi));

                      break;
                    case Period.day30:
                      context.read<NewsBloc>().add(Fetch30days(pathApi));

                      break;
                    default:
                  }
                });
              },
            ),
            BlocBuilder<NewsBloc, NewsState>(
              builder: (context, news) {
                if (news is NewsLoading) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                if (news is NewsError) {
                  return Center(
                    child: Center(
                      child: TextLabelWidget(
                        text: news.message.toString(),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                }

                if (news is NewsSuccess) {
                  return Column(
                    children: news.newsList.map(
                      (newsItem) {
                        String? urlImage;
                        newsItem.media.map((e) {
                          urlImage = e.mediametadata.last.url.trim();
                        }).toList();

                        return InkWell(
                          child: NewsWidget(
                            imageURL:
                                urlImage ?? PublicVariables.imagePlaceholder,
                            title: newsItem.title,
                            description: newsItem.abstract,
                            section: newsItem.section,
                            byline: newsItem.byline,
                            publishedDate: newsItem.publishedDate,
                          ),
                          onTap: () {
                            context.push(
                              nameRoute: AppRoute.newsScreen,
                              arguments: newsItem,
                            );
                          },
                        );
                      },
                    ).toList(),
                  );
                }

                return const Text('Not found');
              },
            ),
          ],
        ),
      ),
    );
  }
}
