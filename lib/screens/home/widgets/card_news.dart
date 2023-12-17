import 'package:assessment2023/Blocs/ThemesBloc/themes_bloc.dart';
import 'package:assessment2023/main.dart';
import 'package:assessment2023/data/models/news_model.dart';
import 'package:assessment2023/screens/home/widgets/text_label.dart';
import 'package:assessment2023/utils/helper/layout.dart';
import 'package:flutter/material.dart';
import 'package:assessment2023/utils/helper/ThemeHelper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardNews extends StatelessWidget {
  const CardNews(
      {super.key,
      required this.objectNews,
      this.onTap,
      this.isBookmark = false,
      this.onBookmark,
      this.onShear,
      required this.size});
  final NewsModel objectNews;
  final Function()? onTap;
  final bool isBookmark;

  final Function()? onBookmark;
  final Function()? onShear;
  final double size;
  @override
  Widget build(BuildContext context) {
    late String? imageURL;
    if (objectNews.media!.isNotEmpty) {
      imageURL = objectNews.media!.first?.mediaMetadata?.first?.url;
    } else {
      imageURL = null;
    }
    return BlocBuilder<ThemesBloc, ThemesState>(
      builder: (context, state) {
        return InkWell(
            onTap: onTap,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              height: size + 25,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: !getIt.get<ThemeHelper>().isDark
                    ? Color(0xffF8F8F8)
                    : Color(0xffF8F8F8).withOpacity(0.2),
              ),
              child: Row(children: [
                Expanded(
                  flex: 2,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    clipBehavior: Clip.antiAlias,
                    child: Image.network(
                      imageURL ?? "",
                      // height: size,
                      // width: size,
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                      errorBuilder: (BuildContext context, Object exception,
                          StackTrace? stackTrace) {
                        return Center(child: const Icon(Icons.error));
                      },
                    ),
                  ),
                ),
                Expanded(
                  flex: 8,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: SizedBox(
                              height: size * 0.15,
                              width: size * 0.15,
                              child: IconButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: onBookmark,
                                  icon: Icon(
                                    isBookmark
                                        ? Icons.bookmark
                                        : Icons.bookmark_border_outlined,
                                    size: size * 0.15,
                                  )),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextLabel(
                                title: objectNews.title,
                                fontSize: (size / 2) * 0.25,
                                fontWeight: FontWeight.bold,
                              ),
                              TextLabel(
                                title: objectNews.abstract,
                                fontSize: (size / 2) * 0.20,
                                maxLines: 2,
                                fontWeight: FontWeight.normal,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              TextLabel(
                                title: objectNews.section,
                                fontSize: (size / 2) * 0.20,
                                maxLines: 1,
                                color: Colors.grey,
                                fontWeight: FontWeight.normal,
                              ),
                              sizeLayout8W,
                              TextLabel(
                                title: objectNews.subsection,
                                fontSize: (size / 2) * 0.20,
                                maxLines: 1,
                                color: Colors.grey,
                                fontWeight: FontWeight.normal,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Row(
                            children: [
                              Flexible(
                                flex: 1,
                                child: IconButton(
                                    padding: EdgeInsets.zero,
                                    splashColor: Colors.transparent,
                                    onPressed: onShear,
                                    icon: Icon(
                                      Icons.share_rounded,
                                      size: size * 0.15,
                                    )),
                              ),
                              Flexible(
                                flex: 10,
                                child: TextLabel(
                                  title: objectNews.byline,
                                  fontSize: (size / 2) * 0.20,
                                  maxLines: 2,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ]),
            ));
      },
    );
  }
}
