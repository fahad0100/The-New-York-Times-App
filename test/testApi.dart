import 'package:assessment2023/data/services/api/api_server.dart';
import 'package:assessment2023/utils/constants/api_constants.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

void main() {
  final getIt = GetIt.instance;
  getIt.registerSingleton<ApiConstants>(ApiConstants());

  group("Test For get All news", () {
    test('Test get data for 1 day', () async {
      final newsRepository = ApiServer();
      final response = await newsRepository.getNewsFromServer(
        periodState: Period.day1,
        path: PathApi.shared,
      );
      expect(response, isNotNull);
      expect(response.status, equals("OK"));
    });
  });

  test('Test get data for 7 days', () async {
    await Future.delayed(const Duration(seconds: 10));
    final newsRepository = ApiServer();
    final response = await newsRepository.getNewsFromServer(
        periodState: Period.day7, path: PathApi.viewed);
    expect(response, isNotNull);
    expect(response.status, equals("OK"));
  });

  test('Test get data for 30 days', () async {
    await Future.delayed(const Duration(seconds: 10));
    final newsRepository = ApiServer();
    final response = await newsRepository.getNewsFromServer(
        periodState: Period.day30, path: PathApi.emailed);
    expect(response, isNotNull);
    expect(response.status, equals("OK"));
  });
}
