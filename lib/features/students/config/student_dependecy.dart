import 'package:dirasaty_admin/core/di/locator.dart';

import '../data/repository/student_repo.dart';
import '../data/source/student_api.dart';

abstract class StudentDependecy {
  static void init() {
    locator.registerLazySingleton(() => StudentApi(locator()));
    locator.registerLazySingleton(() => StudentRepo());
  }
}
