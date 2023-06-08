import 'package:assessment2023/main.dart';
import 'package:assessment2023/data/models/response_news.dart';
import 'package:assessment2023/data/services/api/api_server.dart';
import 'package:dio/dio.dart';

class NewsRepository {
  final dio = Dio();
  Future<ResponseNews> get1day({required PathApi path}) async {
    return await getIt
        .get<ApiServer>()
        .getNewsFromServer(periodState: Period.day1, path: path);
  }

  Future<ResponseNews> get7days({required PathApi path}) async {
    return await getIt
        .get<ApiServer>()
        .getNewsFromServer(periodState: Period.day7, path: path);
  }

  Future<ResponseNews> get30Days({required PathApi path}) async {
    return await getIt
        .get<ApiServer>()
        .getNewsFromServer(periodState: Period.day30, path: path);
  }
}
