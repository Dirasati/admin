
import 'package:dirasaty_admin/core/di/locator.dart';
import '../data/source/parent_api.dart';
import '../data/repository/parent_repository.dart';

abstract class ParentDependency {
  static void init() {
    locator.registerLazySingleton(() => ParentApi(locator()));
    locator.registerLazySingleton(() => ParentRepo());
  }
}
