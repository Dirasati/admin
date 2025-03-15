import 'package:dirasaty_admin/core/di/locator.dart';
import 'package:dirasaty_admin/features/students/data/repository/student_repo.dart';

import '../data/source/student_api.dart';

abstract class StudentDI {
  static void init() {
    locator.registerLazySingleton(() => StudentApi(locator()));
    locator.registerLazySingleton(() => StudentRepo());
  }
}
