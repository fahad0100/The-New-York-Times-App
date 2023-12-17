import 'package:assessment2023/Bloc/ThemesBloc/themes_bloc.dart';
import 'package:assessment2023/Bloc/bookmark/book_mark_bloc.dart';
import 'package:assessment2023/Bloc/news/news_bloc.dart';
import 'package:assessment2023/screens/home/widgets/card_news.dart';
import 'package:assessment2023/screens/home/widgets/segment_label.dart';
import 'package:assessment2023/screens/home/widgets/text_label.dart';
import 'package:assessment2023/screens/widgets/switch_mod_widget.dart';
import 'package:assessment2023/utils/extensions/move_view.dart';
import 'package:assessment2023/utils/extensions/screen_size.dart';
import 'package:assessment2023/utils/helper/add_to_bookmark.dart';
import 'package:assessment2023/utils/helper/check_if_in_bookmark.dart';
import 'package:assessment2023/utils/helper/remove_from_bookmark.dart';
import 'package:assessment2023/utils/helper/layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final blocNews = context.read<NewsBloc>();
    return Scaffold(
      appBar: AppBar(actions: [
        BlocBuilder<ThemesBloc, ThemesState>(
          builder: (context, state) {
            return SwitchModWidget(
              onTap: () {
                context.read<ThemesBloc>().add(ChangeStateEvent());
              },
            );
          },
        )
      ]),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(children: [
          TextLabel(
            title: "Browser",
            fontSize: 30,
            // color:
          ),
          BlocBuilder<NewsBloc, NewsState>(
            buildWhen: (_, newState) {
              if (newState is ChangeLabelState) {
                return true;
              }
              return false;
            },
            builder: (context, state) {
              return Column(
                children: [
                  SegmentLabel(
                      currentIndex: blocNews.selectedProvides,
                      items: ["Emailed", "Shearing", "Viewed"],
                      onTap: (index) {
                        blocNews.add(ChangeProvidesEvent(index: index));
                      }),
                  SegmentLabel(
                    currentIndex: blocNews.selectedPeriod,
                    items: ["1 Day", "7 Days", "30 Days"],
                    onTap: (index) {
                      blocNews.add(ChangeProvidesPeriod(index: index));
                    },
                  ),
                ],
              );
            },
          ),
          sizeLayout16H,
          BlocBuilder<NewsBloc, NewsState>(
            builder: (context, state) {
              if (state is SuccessReloadState) {
                return Column(
                  children: [
                    ...state.dataNews.map((news) {
                      return BlocBuilder<BookMarkBloc, BookMarkState>(
                        buildWhen: (_, newState) {
                          return true;
                        },
                        builder: (context, state) {
                          bool isBookmark = checkIFinBookmark(news: news);

                          return CardNews(
                            size: context.getWidth(divide: 4.4),
                            objectNews: news,
                            isBookmark: isBookmark,
                            onTap: () {
                              context.push(
                                  nameScreen: '/display_news', arguments: news);
                            },
                            onShear: () {},
                            onBookmark: () async {
                              if (isBookmark) {
                                await removeFromBookmark(news: news);
                              } else {
                                addToBookmark(news: news);
                              }
                              context
                                  .read<BookMarkBloc>()
                                  .add(LoadBookMarkEvent());
                            },
                          );
                        },
                      );
                    }).toList()
                  ],
                );
              } else if (state is ErrorReloadState) {
                return SizedBox(
                  height: context.getHeight(divide: 2),
                  child: Center(child: TextLabel(title: state.error)),
                );
              }
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              );
            },
          )
        ]),
      ),
    );
  }
}
