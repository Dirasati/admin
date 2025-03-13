import 'package:dirasaty_admin/core/di/locator.dart';
import 'package:dirasaty_admin/features/auth/data/repository/auth.repo.dart';
import 'package:dirasaty_admin/features/auth/data/source/auth.api.dart';
import 'package:dirasaty_admin/features/auth/data/source/auth.cache.dart';
import 'package:dirasaty_admin/features/auth/logic/auth.cubit.dart';

abstract class AuthDependency {
  static void init() {
    locator.registerLazySingleton<AuthApi>(() => AuthApi(locator()));
    locator.registerLazySingleton<AuthRepo>(() => AuthRepo());

    locator.registerLazySingleton<AuthCache>(() => SecureAuthCache());

    locator.registerLazySingleton<AuthCubit>(
      () => AuthCubit()..checkAuth(),
    );
  }
}
