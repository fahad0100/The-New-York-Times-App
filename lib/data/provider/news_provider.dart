import 'package:assessment2023/data/models/news_model.dart';
import 'package:assessment2023/data/provider/ApiConsent.dart';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

enum ProvidesEnum { emailed, shared, viewed }

enum PeriodEnum { oneDay, sevenDays, thirtyDays }

class NewsProvider {
  Future<List<NewsModel>> readData(
      {ProvidesEnum provide = ProvidesEnum.emailed,
      PeriodEnum period = PeriodEnum.thirtyDays}) async {
    final dio = Dio();
    final ApiConsent consentApi = ApiConsent();
    late String endPointProvide;
    late String endPointPeriod;
    switch (provide) {
      case ProvidesEnum.emailed:
        endPointProvide = consentApi.emailed;
        break;
      case ProvidesEnum.shared:
        endPointProvide = consentApi.shared;
        break;
      case ProvidesEnum.viewed:
        endPointProvide = consentApi.viewed;

        break;
      default:
        endPointProvide = consentApi.emailed;
    }
    switch (period) {
      case PeriodEnum.oneDay:
        endPointPeriod = consentApi.oneDay;
        break;
      case PeriodEnum.sevenDays:
        endPointPeriod = consentApi.sevenDays;
        break;
      case PeriodEnum.thirtyDays:
        endPointPeriod = consentApi.thirtyDays;

        break;
      default:
        endPointProvide = consentApi.thirtyDays;
    }

    try {
      await dotenv.load(fileName: ".env");
      final response = await dio.get(
          '${consentApi.api}$endPointProvide$endPointPeriod?api-key=${dotenv.env['key']}');
      List<NewsModel> newsList = (response.data["results"] as List)
          .map((e) => NewsModel.fromJson(e))
          .toList();

      return newsList;
    } on DioException catch (error) {
      throw FormatException(error.response?.data["fault"]["faultstring"]);
    } catch (error) {
      print(error);
      throw FormatException("There is an error that is not defined");
    }
  }
}
