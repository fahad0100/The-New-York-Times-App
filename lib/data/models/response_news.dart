import 'package:assessment2023/data/models/news.dart';

class ResponseNews {
  ResponseNews({
    required this.status,
    required this.copyright,
    required this.numResults,
    required this.results,
  });
  late final String status;
  late final String copyright;
  late final int numResults;
  late final List<News> results;

  ResponseNews.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    copyright = json['copyright'];
    numResults = json['num_results'];
    results = List.from(json['results']).map((e) => News.fromJson(e)).toList();
  }

  get statusCode => null;

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['copyright'] = copyright;
    _data['num_results'] = numResults;
    _data['results'] = results.map((e) => e.toJson()).toList();
    return _data;
  }
}
