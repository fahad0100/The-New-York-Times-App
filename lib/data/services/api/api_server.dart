import 'package:assessment2023/data/models/response_news.dart';
import 'package:assessment2023/data/services/api/exception.dart';
import 'package:assessment2023/main.dart';
import 'package:assessment2023/utils/constants/api_constants.dart';
import 'package:dio/dio.dart';

class ApiServer {
  final dio = Dio();

  getNewsFromServer(
      {required Period periodState, required PathApi path,}) async {
    try {
      final locator = getIt.get<ApiConstants>();
      String getPeriod = locator.period1day;
      String getPath = locator.pathEmailed;

      switch (path) {
        case PathApi.emailed:
          getPath = locator.pathEmailed;
          break;
        case PathApi.shared:
          getPath = locator.pathShared;
          break;
        case PathApi.viewed:
          getPath = locator.pathViewed;
          break;
        default:
          getPath = locator.pathEmailed;
      }
      switch (periodState) {
        case Period.day1:
          getPeriod = locator.period1day;
          break;
        case Period.day7:
          getPeriod = locator.period7days;
          break;
        case Period.day30:
          getPeriod = locator.period30days;
          break;
        default:
          getPeriod = locator.period1day;
      }

      final response = await dio.get(
        locator.baseURL + getPath + getPeriod,
        queryParameters: {"api-key": locator.key},
      );

      return ResponseNews.fromJson(response.data);
    } on DioException catch (error) {
      switch (error.response?.statusCode) {
        case 401:
          throw Error401("Please check your authorization");
        case 404:
          throw Error404("We did not find your Api endPoint");
        default:
          throw ErrorConnect(
            "Sorry, there was a problem communicating with the service provider wite 15 seconds",
          );
      }
    }
  }
}

enum Period { day1, day7, day30 }

enum PathApi { shared, emailed, viewed }
