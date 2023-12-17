import 'package:assessment2023/data/provider/news_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:assessment2023/data/models/news_model.dart';


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
