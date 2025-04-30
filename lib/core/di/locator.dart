import 'package:dirasaty_admin/features/parent/config/parent_dependency.dart';
import 'package:dirasaty_admin/features/auth/config/auth_dependency.dart';
import 'package:dirasaty_admin/features/students/config/student_dependecy.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:dirasaty_admin/core/router/router.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dirasaty_admin/core/services/cache/cache.service.dart';
import 'package:dirasaty_admin/core/services/dio/dio.service.dart';

import 'locator.config.dart';

final locator = GetIt.instance;

@InjectableInit()
void configureDependencies() => locator.init();

Future<void> setupLocator() async {
  configureDependencies();

  final sharedpref = await SharedPreferences.getInstance();
  // SharedPreferences and FlutterSecureStorage
  locator.registerLazySingleton(() => sharedpref);
  locator.registerLazySingleton(() => FlutterSecureStorage());

  //CacheService
  locator.registerLazySingleton(() => CacheService());

  //Dio
  locator.registerLazySingleton(() => DioService.getDio());

  //Router
  locator.registerSingleton(AppRouter());



  // Features dependencies
  ParentDependency.init();
  AuthDI.init();
  StudentDependecy.init();

  locator.allowReassignment = true;
}
