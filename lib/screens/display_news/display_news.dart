import 'package:assessment2023/main.dart';
import 'package:assessment2023/data/models/news_model.dart';

import 'package:assessment2023/screens/display_news/widgets/ByAuthorWidget.dart';
import 'package:assessment2023/screens/home/widgets/date_widget.dart';
import 'package:assessment2023/screens/home/widgets/text_label.dart';
import 'package:assessment2023/screens/home/widgets/wrap_DesFacet_widget.dart';
import 'package:assessment2023/screens/widgets/Button_custom.dart';
import 'package:assessment2023/screens/widgets/image_display.dart';
import 'package:assessment2023/utils/extensions/screen_size.dart';
import 'package:assessment2023/utils/helper/openURL.dart';
import 'package:assessment2023/utils/helper/layout.dart';
import 'package:flutter/material.dart';
import 'package:assessment2023/utils/helper/ThemeHelper.dart';

class DisplayNewsScreen extends StatelessWidget {
  const DisplayNewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final news = ModalRoute.of(context)!.settings.arguments as NewsModel;
    late String? imageURL;
    if (news.media!.isNotEmpty) {
      imageURL = news.media!.last?.mediaMetadata?.last?.url;
    } else {
      imageURL = null;
    }
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              sizeLayout16H,
              Center(
                  child: TextLabel(
                title: news.title,
                maxLines: 8,
                fontSize: context.getWidth() * 0.070,
              )),
              sizeLayout8H,
              ImageDisplay(
                urlImage: imageURL ?? "",
              ),
              sizeLayout16H,
              ByAuthorWidget(
                author: news.byline,
              ),
              sizeLayout16H,
              TextLabel(
                title: news.abstract,
                fontSize: 12,
                fontWeight: FontWeight.normal,
                maxLines: 10,
                color: !getIt.get<ThemeHelper>().isDark
                    ? Colors.black
                    : Colors.white,
              ),
              sizeLayout16H,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  DateWidget(
                    title: "Published",
                    date: news.publishedDate,
                  ),
                  sizeLayout16W,
                  DateWidget(
                    title: "Update",
                    date: news.updated,
                  ),
                ],
              ),
              sizeLayout16H,
              WrapDesFacetWidget(
                desFacet: news.desFacet,
              ),
              sizeLayout16H,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.newspaper_outlined,
                    color: Colors.grey.withOpacity(0.5),
                  ),
                  TextLabel(
                    title: news.source,
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    maxLines: 10,
                    color: Colors.grey,
                  ),
                ],
              ),
              sizeLayout40H,
              ButtonCustom(
                title: "Read new",
                onTap: () async {
                  await openURL(urlString: news.url);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
