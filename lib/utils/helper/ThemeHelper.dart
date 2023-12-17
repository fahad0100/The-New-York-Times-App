import 'package:get_storage/get_storage.dart';

class ThemeHelper {
  bool isDark;
  ThemeHelper({required this.isDark});

  update({required bool isDark}) async {
    final box = GetStorage();

    this.isDark = isDark;
    await box.write('isDark', isDark);
  }
}
