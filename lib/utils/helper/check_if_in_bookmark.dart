import 'package:assessment2023/data/models/news_model.dart';

import 'package:get_storage/get_storage.dart';

bool checkIFinBookmark({required NewsModel news}) {
  final box = GetStorage();
  bool isInBookmark = false;
  List listNews = box.read('newsBookMark');
  listNews.forEach((element) {
    if (element['id'] == news.id) {
      isInBookmark = true;
    }
  });
  return isInBookmark;
}
