import 'package:assessment2023/data/models/news_model.dart';

import 'package:get_storage/get_storage.dart';

removeFromBookmark({required NewsModel news}) async {
  final box = GetStorage();
  List listNews = box.read('newsBookMark');
  List newList = [];
  List.generate(listNews.length, (index) {
    if (listNews[index]["id"] != news.id) {
      newList.add(listNews[index]);
    }
  });

  await box.write('newsBookMark', newList);
}
