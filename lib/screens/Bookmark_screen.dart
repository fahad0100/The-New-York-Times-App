import 'package:assessment2023/Blocs/bookmark/book_mark_bloc.dart';
import 'package:assessment2023/screens/home/widgets/card_news.dart';
import 'package:assessment2023/utils/extensions/move_view.dart';
import 'package:assessment2023/utils/extensions/screen_size.dart';
import 'package:assessment2023/utils/helper/remove_from_bookmark.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookMarkScreen extends StatelessWidget {
  BookMarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final blocNews = context.read<BookMarkBloc>();
    blocNews.add(LoadBookMarkEvent());
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<BookMarkBloc, BookMarkState>(
          buildWhen: (_, newState) {
            return true;
          },
          builder: (context, state) {
            if (state is SuccessState) {
              if (state.dataNews!.isEmpty) {
                return Center(
                  child: Text("There are no bookmarks saved"),
                );
              }

              return ListView.builder(
                  itemCount: state.dataNews!.length,
                  reverse: true,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return CardNews(
                      size: context.getWidth(divide: 4.4),
                      objectNews: state.dataNews![index],
                      isBookmark: true,
                      onTap: () {
                        context.push(
                            nameScreen: '/display_news',
                            arguments: state.dataNews![index]);
                      },
                      onShear: () {},
                      onBookmark: () async {
                        await removeFromBookmark(news: state.dataNews![index]);
                        blocNews.add(LoadBookMarkEvent());
                      },
                    );
                  });
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
