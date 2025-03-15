import 'package:dirasaty_admin/core/di/locator.dart';

import '../data/source/student_api.dart';

abstract class StudentDI {
  static void init() {
    locator.registerLazySingleton(() => StudentApi(locator()));
  }
}
