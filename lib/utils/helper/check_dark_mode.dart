import 'package:get_storage/get_storage.dart';

checkDarkMode() async {
  final box = GetStorage();
  if (!box.hasData('isDark')) {
    await box.write('isDark', false);
  }
  if (!box.hasData('newsBookMark')) {
    await box.write('newsBookMark', []);
  }
}
