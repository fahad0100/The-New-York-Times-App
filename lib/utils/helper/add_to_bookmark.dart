import 'package:assessment2023/data/models/news_model.dart';

import 'package:get_storage/get_storage.dart';

addToBookmark({required NewsModel news}) async {
  final box = GetStorage();
  List listNews = box.read('newsBookMark');

  listNews.add(news.toJson());

  await box.write('newsBookMark', listNews);
}
