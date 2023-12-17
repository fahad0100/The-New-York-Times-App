import 'package:assessment2023/data/provider/news_provider.dart';
import 'package:assessment2023/main.dart';
import 'package:assessment2023/utils/helper/ThemeHelper.dart';
import 'package:assessment2023/utils/helper/check_dark_mode.dart';
import 'package:get_storage/get_storage.dart';

Future setupGetIt() async {
  await checkDarkMode();
  final box = GetStorage();

  getIt.registerSingleton<ThemeHelper>(
      ThemeHelper(isDark: await box.read("isDark")));
  getIt.registerSingleton<NewsProvider>(NewsProvider());

}
